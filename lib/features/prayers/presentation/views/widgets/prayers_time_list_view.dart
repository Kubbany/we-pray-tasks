import 'package:flutter/material.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/prayer_entity.dart';

import 'prayer_time_item.dart';

class PrayersTimeListView extends StatelessWidget {
  const PrayersTimeListView({
    super.key,
    required this.prayers,
  });
  final List<PrayerEntity> prayers;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) => PrayerTimeItem(prayer: prayers[index]),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
