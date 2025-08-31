class LocationEntity {
  final double latitude;
  final double longitude;

  const LocationEntity({required this.latitude, required this.longitude});
  factory LocationEntity.fromGeolocatorPosition(dynamic position) {
    return LocationEntity(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
