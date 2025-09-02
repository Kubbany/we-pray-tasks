import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:we_pray_tasks/core/errors/failure.dart';
import 'package:we_pray_tasks/core/services/location_service/location_service.dart';
import 'package:we_pray_tasks/core/utils/repos/location_repo/location_repo.dart';
import 'package:we_pray_tasks/features/qibla/domain/entities/location_entity.dart';

class LocationRepoImpl implements LocationRepo {
  final LocationService _locationService;

  LocationRepoImpl(this._locationService);
  @override
  Future<Either<Failure, LocationEntity>> getLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return const Left(LocationFailure('Location services are disabled.'));
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return const Left(PermissionFailure('Location permission denied.'));
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return const Left(PermissionFailure('Location permission permanently denied.'));
      }
      final location = await _locationService.getLocation();
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
}
