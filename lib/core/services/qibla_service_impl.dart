import 'package:adhan/adhan.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:we_pray_tasks/core/services/qibla_service.dart';

class QiblaServiceImpl implements QiblaService {
  @override
  Future<LocationEntity> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
    return LocationEntity(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  @override
  Future<String> getCityName(LocationEntity location) async {
    final placemarks = await placemarkFromCoordinates(location.latitude, location.longitude);

    final cityName = "${placemarks.first.locality ?? ''}, ${placemarks.first.country ?? ''}".trim();

    return cityName;
  }

  @override
  double getQiblaDirection(LocationEntity location) {
    final coordinates = Coordinates(location.latitude, location.longitude);
    final qibla = Qibla(coordinates);
    return qibla.direction;
  }
}
