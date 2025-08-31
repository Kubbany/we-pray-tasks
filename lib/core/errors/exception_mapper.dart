import 'failure.dart';

class ExceptionMapper {
  static Failure mapException(Exception e) {
    if (e.toString().contains('denied')) {
      return const PermissionFailure('Location permission denied.');
    } else if (e.toString().contains('disabled')) {
      return const LocationFailure('Location services are disabled.');
    } else {
      return UnknownFailure(e.toString());
    }
  }
}
