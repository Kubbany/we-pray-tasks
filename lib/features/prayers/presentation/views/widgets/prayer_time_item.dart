import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_images.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        Assets.imagesPrayerPng,
      ),
      title: const Row(
        spacing: 61,
        children: <Widget>[
          Text(
            'Fajr',
            style: AppStyles.mediumHanken16,
          ),
          Text(
            '5:30am',
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
