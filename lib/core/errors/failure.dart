abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class LocationFailure extends Failure {
  const LocationFailure(super.message);
}

class PermissionFailure extends Failure {
  const PermissionFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
