import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:we_pray_tasks/constants.dart';
import 'package:we_pray_tasks/core/services/prayers_service/prayers_service.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/current_prayer_entity.dart';
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
  CurrentPrayerEntity getCurrentPrayer(Coordinates coordinates) {
    final params = CalculationMethod.muslim_world_league.getParameters();
    final prayerTimes = PrayerTimes.today(coordinates, params);

    Prayer prayer = prayerTimes.nextPrayer();
    if (prayer == Prayer.none) prayer = Prayer.isha;
    final formattedTime = DateFormat('h:mma').format(prayerTimes.timeForPrayer(prayer)!).toLowerCase();
    return _mapPrayer(prayer, formattedTime);
  }

  CurrentPrayerEntity _mapPrayer(Prayer prayer, String formattedTime) {
    final time = formattedTime.substring(0, formattedTime.length - 2);
    final period = formattedTime.substring(formattedTime.length - 2);
    switch (prayer) {
      case Prayer.fajr:
        return CurrentPrayerEntity(
          name: 'Fajr',
          time: time,
          period: period,
          color: kFajrColor,
        );
      case Prayer.dhuhr:
        return CurrentPrayerEntity(
          name: DateTime.now().weekday == DateTime.friday ? 'Jumu\'a' : 'Duhur',
          time: time,
          period: period,
          color: kDuhurColor,
        );
      case Prayer.asr:
        return CurrentPrayerEntity(
          name: 'Asr',
          time: time,
          period: period,
          color: kAsrColor,
        );
      case Prayer.maghrib:
        return CurrentPrayerEntity(
          name: 'Maghrib',
          time: time,
          period: period,
          color: kMaghribColor,
        );
      case Prayer.isha:
        return CurrentPrayerEntity(
          name: 'Isha',
          time: time,
          period: period,
          color: kIshaColor,
        );
      default:
        return CurrentPrayerEntity(
          name: 'Isha',
          time: time,
          period: period,
          color: kIshaColor,
        );
    }
  }
}
