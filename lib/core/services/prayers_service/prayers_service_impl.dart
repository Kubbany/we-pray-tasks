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
  List<PrayerEntity> getDatePrayers(DateTime date, Coordinates coordinates) {
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

  @override
  PrayerEntity getCurrentPrayer(Coordinates coords) {
    final params = CalculationMethod.muslim_world_league.getParameters();
    final prayerTimes = PrayerTimes.today(coords, params);

    Prayer prayer = prayerTimes.nextPrayer();
    if (prayer == Prayer.none) prayer = Prayer.isha;

    return PrayerEntity(
      name: _mapName(prayer),
      time: _formatTime(prayerTimes.timeForPrayer(prayer)!),
    );
  }

  String _mapName(Prayer prayer) {
    switch (prayer) {
      case Prayer.fajr:
        return 'Fajr';
      case Prayer.dhuhr:
        return DateTime.now().weekday == DateTime.friday ? 'Jumu\'a' : 'Duhur';
      case Prayer.asr:
        return 'Asr';
      case Prayer.maghrib:
        return 'Maghrib';
      case Prayer.isha:
        return 'Isha';
      default:
        return 'Unknown';
    }
  }
}
