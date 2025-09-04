import 'package:dartz/dartz.dart';
import 'package:adhan/adhan.dart';
import 'package:we_pray_tasks/core/errors/failure.dart';
import 'package:we_pray_tasks/core/services/prayers_service/prayers_service.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/prayer_entity.dart';
import 'package:we_pray_tasks/features/prayers/domain/repos/prayers_repo.dart';

class PrayersRepoImpl implements PrayersRepo {
  final PrayersService prayersService;

  PrayersRepoImpl(
    this.prayersService,
  );

  @override
  Future<Either<Failure, List<PrayerEntity>>> getDatePrayers({
    required DateTime date,
    required Coordinates coordinates,
  }) async {
    try {
      final prayers = await prayersService.getDatePrayers(date, coordinates);

      return Right(prayers);
    } catch (e) {
      return const Left(UnknownFailure('Could not get prayers'));
    }
  }
}
