import 'package:adhan/adhan.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/prayer_entity.dart';

abstract class PrayersService {
  List<PrayerEntity> getDatePrayers(DateTime date, Coordinates coordinates);
  PrayerEntity getCurrentPrayer(Coordinates coordinates);
}
