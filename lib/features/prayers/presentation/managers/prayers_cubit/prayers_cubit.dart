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

  PrayersCubit(
    this.prayersRepo,
    this.locationRepo,
  ) : super(const PrayersInitial());

  Future<void> getPrayers(DateTime date) async {
    emit(const PrayersLoading());
    final locationResult = await locationRepo.getLocation();

    return locationResult.fold(
      (failure) {
        emit(PrayersFailure(failure.message));
      },
      (location) async {
        _cachedLocation ??= location;
        final result = await prayersRepo.getDatePrayers(
          date: date,
          coordinates: Coordinates(_cachedLocation!.latitude, _cachedLocation!.longitude),
        );

        result.fold(
          (failure) => emit(PrayersFailure(failure.message)),
          (prayers) => emit(PrayersSuccess(prayers: prayers, date: date)),
        );
      },
    );
  }
}
