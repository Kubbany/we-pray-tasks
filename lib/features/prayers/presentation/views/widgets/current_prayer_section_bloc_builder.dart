import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/features/prayers/presentation/managers/prayers_cubit/prayers_cubit.dart';
import 'package:we_pray_tasks/features/prayers/presentation/managers/prayers_cubit/prayers_state.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/skeletonizer_current_prayer.dart';

import 'current_prayer_section.dart';

class CurrentPrayerSectionBlocBuilder extends StatefulWidget {
  const CurrentPrayerSectionBlocBuilder({super.key});

  @override
  State<CurrentPrayerSectionBlocBuilder> createState() => _CurrentPrayerSectionBlocBuilderState();
}

class _CurrentPrayerSectionBlocBuilderState extends State<CurrentPrayerSectionBlocBuilder> {
  @override
  initState() {
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
          return CurrentPrayerSection(
            prayer: state.prayer,
          );
        } else if (state is CurrentPrayerFailure) {
          return Center(child: Text(state.message));
        } else if (state is CurrentPrayerLoading) {
          return const SkeletonizerCurrentPrayer();
        }
        return const SizedBox();
      },
    );
  }
}
