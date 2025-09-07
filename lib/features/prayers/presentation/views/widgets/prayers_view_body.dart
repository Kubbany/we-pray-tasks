import 'package:flutter/material.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayers_header_section.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayers_time_section.dart';

class PrayersViewBody extends StatelessWidget {
  const PrayersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CurrentPrayerSection(),
              Transform.translate(
                offset: Offset(0, -MediaQuery.sizeOf(context).height * 0.07),
                child: const PrayersTimeSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
