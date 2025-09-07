import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/current_prayer_entity.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/current_prayer_section.dart';

class SkeletonizerCurrentPrayer extends StatelessWidget {
  const SkeletonizerCurrentPrayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: CurrentPrayerSection(
        prayer: CurrentPrayerEntity(
          name: 'Fajr',
          time: '5:30',
          period: 'am',
          color: Colors.transparent,
        ),
      ),
    );
  }
}
