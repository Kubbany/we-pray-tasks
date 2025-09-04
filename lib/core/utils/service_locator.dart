import 'package:get_it/get_it.dart';
import 'package:we_pray_tasks/core/services/location_service/location_service.dart';
import 'package:we_pray_tasks/core/services/location_service/location_service_impl.dart';
import 'package:we_pray_tasks/core/services/prayers_service/prayers_service.dart';
import 'package:we_pray_tasks/core/services/prayers_service/prayers_service_impl.dart';
import 'package:we_pray_tasks/core/services/qibla_service/qibla_service.dart';
import 'package:we_pray_tasks/core/services/qibla_service/qibla_service_impl.dart';
import 'package:we_pray_tasks/core/utils/repos/location_repo/location_repo.dart';
import 'package:we_pray_tasks/core/utils/repos/location_repo/location_repo_impl.dart';
import 'package:we_pray_tasks/features/prayers/data/repos/prayers_repo_impl.dart';
import 'package:we_pray_tasks/features/prayers/domain/repos/prayers_repo.dart';
import 'package:we_pray_tasks/features/qibla/data/repos/qibla_repo_impl.dart';
import 'package:we_pray_tasks/features/qibla/domain/repos/qibla_repo.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<QiblaService>(
    QiblaServiceImpl(),
  );
  getIt.registerSingleton<QiblaRepo>(
    QiblaRepoImpl(getIt.get<QiblaService>()),
  );
  getIt.registerSingleton<LocationService>(
    LocationServiceImpl(),
  );
  getIt.registerSingleton<LocationRepo>(
    LocationRepoImpl(getIt.get<LocationService>()),
  );
  getIt.registerSingleton<PrayersService>(
    PrayersServiceImpl(),
  );
  getIt.registerSingleton<PrayersRepo>(
    PrayersRepoImpl(getIt.get<PrayersService>()),
  );
}
