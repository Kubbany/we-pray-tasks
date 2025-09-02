import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:we_pray_tasks/constants.dart';
import 'package:we_pray_tasks/core/utils/repos/location_repo/location_repo.dart';
import 'package:we_pray_tasks/features/qibla/domain/entities/location_entity.dart';
import 'package:we_pray_tasks/features/qibla/domain/repos/qibla_repo.dart';

part 'qibla_state.dart';

class QiblaCubit extends Cubit<QiblaState> {
  final QiblaRepo _qiblaRepo;
  final LocationRepo _locationRepo;
  StreamSubscription<CompassEvent>? _compassSubscription;

  QiblaCubit(this._qiblaRepo, this._locationRepo) : super(QiblaInitial());

  Future<void> getQiblaDirection() async {
    emit(QiblaLoading());

    final locationResult = await _locationRepo.getLocation();

    locationResult.fold(
      (failure) => emit(QiblaFailure(failure.message)),
      (location) {
        final qiblaResult = _qiblaRepo.getQiblaDirection(location);
        qiblaResult.fold(
          (failure) => emit(QiblaFailure(failure.message)),
          (qiblaDirection) => _listenToCompass(qiblaDirection, location),
        );
      },
    );
  }

  void _listenToCompass(double qiblaDirection, LocationEntity location) {
    _compassSubscription?.cancel();

    DateTime lastEmit = DateTime.now().subtract(kRequestDuration);

    _compassSubscription = FlutterCompass.events?.listen(
      (event) {
        final now = DateTime.now();
        if (now.difference(lastEmit) >= kRequestDuration) {
          lastEmit = now;
          final heading = event.heading ?? 0.0;
          emit(
            QiblaSuccess(
              heading: heading,
              qiblaDirection: qiblaDirection,
            ),
          );
        }
      },
      onError: (error) => emit(QiblaFailure('Compass error: $error')),
    );
  }

  @override
  Future<void> close() {
    _compassSubscription?.cancel();
    return super.close();
  }
}
