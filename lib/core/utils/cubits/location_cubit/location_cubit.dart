import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/features/qibla/domain/repos/qibla_repo.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this._qiblaRepo) : super(LocationInitial());
  final QiblaRepo _qiblaRepo;

  Future<void> getCityName() async {
    emit(LocationLoading());

    final location = await _qiblaRepo.getLocation();
    location.fold(
      (failure) {
        emit(LocationFailure(failure.message));
      },
      (location) async {
        final place = await _qiblaRepo.getCityName(location);
        place.fold(
          (failure) {
            emit(LocationFailure(failure.message));
          },
          (place) => emit(LocationSuccess(place)),
        );
      },
    );
  }
}
