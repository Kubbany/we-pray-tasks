import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:we_pray_tasks/constants.dart';
import 'package:we_pray_tasks/core/services/shared_prefs.dart';
import 'package:we_pray_tasks/core/utils/repos/location_repo/location_repo.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this._locationRepo) : super(LocationInitial());
  final LocationRepo _locationRepo;

  Future<void> getCityName() async {
    emit(LocationLoading());

    final location = await _locationRepo.getLocation();
    location.fold(
      (failure) {
        emit(LocationFailure(failure.message));
      },
      (location) async {
        final place = await _locationRepo.getCityName(location);
        place.fold(
          (failure) {
            emit(LocationFailure(failure.message));
          },
          (place) => emit(LocationSuccess(place)),
        );
      },
    );
  }

  void resetCachedLocation() {
    _locationRepo.resetCachedLocation();
  }

  Future<void> requestLocationPermission() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      SharedPrefs.setBool(kLocationAccessKey, false);
      emit(LocationPermissionFailure('Location permission denied, Allow it and try again.'));
    } else if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      SharedPrefs.setBool(kLocationAccessKey, true);
      emit(LocationPermissionSuccess());
    }
  }

  void checkLocationPermission() {
    final bool isLocationAllowed = SharedPrefs.getBool(kLocationAccessKey);
    if (isLocationAllowed) {
      emit(LocationPermissionSuccess());
    }
  }
}
