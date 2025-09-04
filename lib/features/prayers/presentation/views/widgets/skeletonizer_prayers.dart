import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/prayer_entity.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayer_time_item.dart';

class SkeletonizerPrayers extends StatelessWidget {
  const SkeletonizerPrayers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) => const Skeletonizer(
        child: PrayerTimeItem(
          prayer: (PrayerEntity(name: 'Fajr', time: '5:30am')),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
