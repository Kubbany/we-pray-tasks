import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/features/prayers/presentation/managers/prayers_cubit/prayers_cubit.dart';
import 'package:we_pray_tasks/features/prayers/presentation/managers/prayers_cubit/prayers_state.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/current_prayer.dart';

class CurrentPrayerBlocBuilder extends StatefulWidget {
  const CurrentPrayerBlocBuilder({
    super.key,
  });

  @override
  State<CurrentPrayerBlocBuilder> createState() => _CurrentPrayerBlocBuilderState();
}

class _CurrentPrayerBlocBuilderState extends State<CurrentPrayerBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<PrayersCubit>().getCurrentPrayer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayersCubit, PrayersState>(
      buildWhen: (previous, current) =>
          current is CurrentPrayerSuccess || current is CurrentPrayerLoading || current is CurrentPrayerFailure,
      builder: (context, state) {
        if (state is CurrentPrayerSuccess) {
          final prayer = state.prayer;
          final time = prayer.time.substring(0, prayer.time.length - 2);
          final period = prayer.time.substring(prayer.time.length - 2);
          return CurrentPrayer(prayerName: prayer.name, time: time, period: period);
        } else if (state is CurrentPrayerFailure) {
          return Center(child: Text(state.message));
        } else if (state is CurrentPrayerLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
