import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/widgets/custom_body_container.dart';
import 'package:we_pray_tasks/features/prayers/presentation/managers/prayers_cubit/prayers_cubit.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/date_picker.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayers_time_list_view_bloc_builder.dart';

class PrayersTimeSection extends StatelessWidget {
  const PrayersTimeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBodyContainer(
      child: Column(
        spacing: 50,
        children: [
          DatePicker(
            onDateChanged: (date) {
              context.read<PrayersCubit>().getPrayers(date);
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PrayerTimeListViewBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
