import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_images.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';

class PrayerItemLeading extends StatelessWidget {
  const PrayerItemLeading({
    super.key,
    required this.prayerName,
  });

  final String prayerName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118,
      child: Row(
        spacing: 12,
        children: <Widget>[
          Image.asset(
            Assets.imagesPrayerPng,
          ),
          Text(
            prayerName,
            style: AppStyles.mediumHanken16,
          ),
        ],
      ),
    );
  }
}
