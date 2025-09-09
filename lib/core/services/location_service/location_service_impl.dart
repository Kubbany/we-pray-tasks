import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:we_pray_tasks/core/services/location_service/location_service.dart';
import 'package:we_pray_tasks/features/qibla/domain/entities/location_entity.dart';

class LocationServiceImpl implements LocationService {
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

    final cityName =
        "${placemarks.first.locality ?? 'Unknown Location'}, ${placemarks.first.country ?? 'Unknown Country'}".trim();

    return cityName;
  }
}
