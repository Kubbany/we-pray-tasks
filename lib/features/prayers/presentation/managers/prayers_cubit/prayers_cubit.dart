import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/repos/location_repo/location_repo.dart';
import 'package:we_pray_tasks/features/prayers/domain/repos/prayers_repo.dart';
import 'package:we_pray_tasks/features/prayers/presentation/managers/prayers_cubit/prayers_state.dart';
import 'package:we_pray_tasks/features/qibla/domain/entities/location_entity.dart';

class PrayersCubit extends Cubit<PrayersState> {
  final PrayersRepo prayersRepo;
  final LocationRepo locationRepo;

  LocationEntity? _cachedLocation;
  Timer? _timer;

  PrayersCubit(this.prayersRepo, this.locationRepo) : super(const PrayersInitial());

  Future<void> getPrayers(DateTime date) async {
    emit(const PrayersLoading());
    final location = await _getLocation();
    if (location == null) return emit(const PrayersFailure('No location'));

    final result = prayersRepo.getDatePrayers(
      date: date,
      coordinates: Coordinates(location.latitude, location.longitude),
    );

    result.fold(
      (failure) => emit(PrayersFailure(failure.message)),
      (prayers) => emit(PrayersSuccess(prayers: prayers, date: date)),
    );
  }

  Future<void> getCurrentPrayer() async {
    await _updateCurrentPrayer();
    _timer ??= Timer.periodic(const Duration(minutes: 45), (_) => _updateCurrentPrayer());
  }

  Future<void> _updateCurrentPrayer() async {
    emit(const CurrentPrayerLoading());
    final location = await _getLocation();
    if (location == null) return;

    final result = prayersRepo.getCurrentPrayer(
      coordinates: Coordinates(location.latitude, location.longitude),
    );

    result.fold(
      (failure) => emit(CurrentPrayerFailure(failure.message)),
      (prayer) => emit(CurrentPrayerSuccess(prayer)),
    );
  }

  Future<LocationEntity?> _getLocation() async {
    if (_cachedLocation != null) return _cachedLocation;
    final result = await locationRepo.getLocation();
    return result.fold((_) => null, (location) {
      _cachedLocation = location;
      return location;
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
