import 'package:dartz/dartz.dart';
import 'package:we_pray_tasks/core/errors/failure.dart';
import 'package:we_pray_tasks/core/services/location_service/location_service.dart';
import 'package:we_pray_tasks/core/utils/repos/location_repo/location_repo.dart';
import 'package:we_pray_tasks/features/qibla/domain/entities/location_entity.dart';

class LocationRepoImpl implements LocationRepo {
  final LocationService _locationService;
  LocationEntity? cachedLocation;
  LocationRepoImpl(this._locationService);
  @override
  Future<Either<Failure, LocationEntity>> getLocation() async {
    if (cachedLocation != null) {
      return Right(cachedLocation!);
    }
    try {
      final location = await _locationService.getLocation();
      cachedLocation = location;
      return Right(location);
    } catch (e) {
      return const Left(UnknownFailure('Error fetching location'));
    }
  }

  @override
  Future<Either<Failure, String>> getCityName(LocationEntity location) async {
    try {
      final String cityName = await _locationService.getCityName(location);
      return Right(cityName);
    } catch (e) {
      return const Left(UnknownFailure('Error getting city name'));
    }
  }

  @override
  void resetCachedLocation() {
    cachedLocation = null;
  }
}
