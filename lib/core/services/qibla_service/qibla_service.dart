import 'package:we_pray_tasks/features/qibla/domain/entities/location_entity.dart';

abstract class QiblaService {
  double getQiblaDirection(LocationEntity location);
}
