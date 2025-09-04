import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_images.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/prayer_entity.dart';

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({super.key, required this.prayer});
  final PrayerEntity prayer;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        Assets.imagesPrayerPng,
      ),
      title: Row(
        spacing: 61,
        children: <Widget>[
          Text(
            prayer.name,
            style: AppStyles.mediumHanken16,
          ),
          Text(
            prayer.time,
            style: AppStyles.mediumSans16,
          ),
        ],
      ),
      trailing: Image.asset(
        Assets.imagesNotificationPng,
      ),
    );
  }
}
