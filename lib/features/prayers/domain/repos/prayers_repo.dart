import 'package:adhan/adhan.dart';
import 'package:dartz/dartz.dart';
import 'package:we_pray_tasks/core/errors/failure.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/prayer_entity.dart';

abstract class PrayersRepo {
  Either<Failure, List<PrayerEntity>> getDatePrayers({
    required DateTime date,
    required Coordinates coordinates,
  });

  Either<Failure, PrayerEntity> getCurrentPrayer({required Coordinates coordinates});
}
