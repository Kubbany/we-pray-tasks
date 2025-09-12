import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/repos/location_repo/location_repo.dart';
import 'package:we_pray_tasks/features/prayers/domain/repos/prayers_repo.dart';
import 'package:we_pray_tasks/features/prayers/presentation/managers/prayers_cubit/prayers_state.dart';

class PrayersCubit extends Cubit<PrayersState> {
  final PrayersRepo _prayersRepo;
  final LocationRepo _locationRepo;

  Timer? _timer;

  PrayersCubit(this._prayersRepo, this._locationRepo) : super(const PrayersInitial());

  Future<void> getPrayers(DateTime date) async {
    emit(const PrayersLoading());
    final location = await _locationRepo.getLocation();

    location.fold(
      (failure) {
        emit(PrayersFailure(failure.message));
      },
      (location) {
        final result = _prayersRepo.getDatePrayers(
          date: date,
          coordinates: Coordinates(location.latitude, location.longitude),
        );

        result.fold(
          (failure) => emit(PrayersFailure(failure.message)),
          (prayers) => emit(PrayersSuccess(prayers: prayers, date: date)),
        );
      },
    );
  }

  Future<void> getCurrentPrayer() async {
    await _updateCurrentPrayer();
    _timer ??= Timer.periodic(const Duration(minutes: 5), (_) => _updateCurrentPrayer());
  }

  Future<void> _updateCurrentPrayer() async {
    emit(const CurrentPrayerLoading());
    final location = await _locationRepo.getLocation();
    location.fold(
      (failure) {
        emit(CurrentPrayerFailure(failure.message));
      },
      (location) {
        final result = _prayersRepo.getCurrentPrayer(
          coordinates: Coordinates(location.latitude, location.longitude),
        );

        result.fold(
          (failure) => emit(CurrentPrayerFailure(failure.message)),
          (prayer) => emit(CurrentPrayerSuccess(prayer)),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
