import 'package:dartz/dartz.dart';
import 'package:we_pray_tasks/core/errors/failure.dart';
import 'package:we_pray_tasks/features/qibla/domain/entities/location_entity.dart';

abstract class LocationRepo {
  Future<Either<Failure, LocationEntity>> getLocation();
  Future<Either<Failure, String>> getCityName(LocationEntity location);
  void resetCachedLocation();
}
