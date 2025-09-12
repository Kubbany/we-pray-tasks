import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:we_pray_tasks/features/prayers/presentation/managers/prayers_cubit/prayers_cubit.dart';
import 'package:we_pray_tasks/features/prayers/presentation/managers/prayers_cubit/prayers_state.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayers_time_list_view.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/skeletonizer_prayers.dart';

class PrayerTimeListViewBlocBuilder extends StatelessWidget {
  const PrayerTimeListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayersCubit, PrayersState>(
      buildWhen: (previous, current) =>
          current is PrayersSuccess || current is PrayersFailure || current is PrayersLoading,
      builder: (context, state) {
        if (state is PrayersFailure) {
          Center(child: Text(state.message));
        } else if (state is PrayersSuccess) {
          return PrayersTimeListView(
            prayers: state.prayers,
          );
        } else if (state is PrayersLoading) {
          return const SkeletonizerPrayers();
        }
        return const SizedBox();
      },
    );
  }
}
