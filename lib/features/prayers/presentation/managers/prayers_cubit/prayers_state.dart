import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/prayer_entity.dart';

@immutable
sealed class PrayersState extends Equatable {
  const PrayersState();

  @override
  List<Object?> get props => [];
}

final class PrayersInitial extends PrayersState {
  const PrayersInitial();
}

final class PrayersLoading extends PrayersState {
  const PrayersLoading();
}

final class PrayersSuccess extends PrayersState {
  final List<PrayerEntity> prayers;
  final DateTime date;

  const PrayersSuccess({
    required this.prayers,
    required this.date,
  });

  @override
  List<Object?> get props => [prayers, date];
}

final class PrayersFailure extends PrayersState {
  final String message;

  const PrayersFailure(this.message);

  @override
  List<Object?> get props => [message];
}
