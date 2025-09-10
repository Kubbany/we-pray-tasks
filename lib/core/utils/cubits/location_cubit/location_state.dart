part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationPermissionSuccess extends LocationState {}

class LocationSuccess extends LocationState {
  final String place;
  LocationSuccess(this.place);
}

class LocationFailure extends LocationState {
  final String message;
  LocationFailure(this.message);
}

class LocationPermissionFailure extends LocationState {
  final String message;
  LocationPermissionFailure(this.message);
}
