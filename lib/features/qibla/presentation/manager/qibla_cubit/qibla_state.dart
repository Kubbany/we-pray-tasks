part of 'qibla_cubit.dart';

@immutable
abstract class QiblaState {}

class QiblaInitial extends QiblaState {}

class QiblaLoading extends QiblaState {}

class QiblaSuccess extends QiblaState {
  final double heading;
  final double qiblaDirection;

  QiblaSuccess({
    required this.heading,
    required this.qiblaDirection,
  });
}

class QiblaFailure extends QiblaState {
  final String message;
  QiblaFailure(this.message);
}
