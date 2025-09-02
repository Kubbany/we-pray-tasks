import 'package:dartz/dartz.dart';
import 'package:we_pray_tasks/core/errors/failure.dart';
import 'package:we_pray_tasks/core/services/qibla_service/qibla_service.dart';
import 'package:we_pray_tasks/features/qibla/domain/entities/location_entity.dart';
import 'package:we_pray_tasks/features/qibla/domain/repos/qibla_repo.dart';

class QiblaRepoImpl implements QiblaRepo {
  final QiblaService _qiblaService;

  QiblaRepoImpl(this._qiblaService);

  @override
  Either<Failure, double> getQiblaDirection(LocationEntity location) {
    try {
      double bearing = _qiblaService.getQiblaDirection(location);
      return Right(bearing);
    } catch (e) {
      return const Left(UnknownFailure('Error calculating Qibla direction'));
    }
  }
}
