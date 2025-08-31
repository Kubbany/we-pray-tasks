import 'package:qibla/features/qibla/domain/entities/location_entity.dart';

abstract class QiblaService {
  Future<LocationEntity> getLocation();
  Future<String> getCityName(LocationEntity location);
  double getQiblaDirection(LocationEntity location);
}
