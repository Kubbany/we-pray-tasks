import 'package:get_it/get_it.dart';
import 'package:we_pray_tasks/core/services/qibla_service.dart';
import 'package:we_pray_tasks/core/services/qibla_service_impl.dart';
import 'package:we_pray_tasks/features/qibla/domain/repos/qibla_repo.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<QiblaService>(
    QiblaServiceImpl(),
  );
  getIt.registerSingleton<QiblaRepo>(
    QiblaRepoImpl(getIt.get<QiblaService>()),
  );
}
