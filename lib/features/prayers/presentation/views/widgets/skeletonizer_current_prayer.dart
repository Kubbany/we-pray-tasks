import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/current_prayer.dart';

class SkeletonizerCurrentPrayer extends StatelessWidget {
  const SkeletonizerCurrentPrayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      containersColor: Colors.grey,
      child: CurrentPrayer(
        prayerName: 'Maghrib',
        time: '5.30',
        period: 'pm',
      ),
    );
  }
}
