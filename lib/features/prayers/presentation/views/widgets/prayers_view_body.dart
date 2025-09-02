import 'package:flutter/material.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/jamea_background_stack.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayers_header_section.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayers_time_section.dart';

class PrayersViewBody extends StatelessWidget {
  const PrayersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const JameaBackgroundStack(
      child: Column(
        spacing: 78,
        children: [
          CurrentPrayerSection(),
          Expanded(
            child: PrayersTimeSection(),
          ),
        ],
      ),
    );
  }
}
