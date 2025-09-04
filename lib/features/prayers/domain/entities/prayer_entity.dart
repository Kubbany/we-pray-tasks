import 'package:hive/hive.dart';

part 'prayer_entity.g.dart';

@HiveType(typeId: 0)
class PrayerEntity {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String time;

  const PrayerEntity({
    required this.name,
    required this.time,
  });
}
