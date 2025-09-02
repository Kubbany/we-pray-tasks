import 'package:adhan/adhan.dart';
import 'package:we_pray_tasks/core/services/qibla_service/qibla_service.dart';
import 'package:we_pray_tasks/features/qibla/domain/entities/location_entity.dart';

class QiblaServiceImpl implements QiblaService {
  @override
  double getQiblaDirection(LocationEntity location) {
    final coordinates = Coordinates(location.latitude, location.longitude);
    final qibla = Qibla(coordinates);
    return qibla.direction;
  }
}
