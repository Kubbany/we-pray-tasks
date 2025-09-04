// lib/features/prayers/data/services/prayers_service_impl.dart
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:we_pray_tasks/core/services/prayers_service/prayers_service.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/prayer_entity.dart';

class PrayersServiceImpl implements PrayersService {
  String _formatTime(DateTime dateTime) {
    return DateFormat('h.mma').format(dateTime).toLowerCase();
  }

  @override
  Future<List<PrayerEntity>> getDatePrayers(DateTime date, Coordinates coordinates) async {
    final params = CalculationMethod.muslim_world_league.getParameters();
    final dateComponents = DateComponents.from(date.toLocal());
    final prayerTimes = PrayerTimes(coordinates, dateComponents, params);

    final prayers = <PrayerEntity>[
      PrayerEntity(
        name: 'Fajr',
        time: _formatTime(prayerTimes.fajr),
      ),
      PrayerEntity(
        name: date.weekday == DateTime.friday ? "Jumu'a" : 'Duhur',
        time: _formatTime(prayerTimes.dhuhr),
      ),
      PrayerEntity(
        name: 'Asr',
        time: _formatTime(prayerTimes.asr),
      ),
      PrayerEntity(
        name: 'Maghrib',
        time: _formatTime(prayerTimes.maghrib),
      ),
      PrayerEntity(
        name: 'Isha',
        time: _formatTime(prayerTimes.isha),
      ),
    ];

    return prayers;
  }
}
