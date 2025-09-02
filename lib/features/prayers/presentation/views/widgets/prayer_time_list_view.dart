import 'package:flutter/material.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayer_time_item.dart';

class PrayerTimeListView extends StatelessWidget {
  const PrayerTimeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) => const PrayerTimeItem(),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
