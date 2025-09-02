import 'package:we_pray_tasks/features/qibla/domain/entities/location_entity.dart';

abstract class LocationService {
  Future<LocationEntity> getLocation();
  Future<String> getCityName(LocationEntity location);
}
