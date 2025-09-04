import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_images.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/prayer_entity.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayer_item_leading.dart';

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({super.key, required this.prayer});
  final PrayerEntity prayer;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          PrayerItemLeading(prayerName: prayer.name),
          const SizedBox(
            width: 28,
          ),
          Text(
            prayer.time,
            style: AppStyles.mediumSans16,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Image.asset(
            Assets.imagesNotificationPng,
          ),
        ],
      ),
    );
  }
}
