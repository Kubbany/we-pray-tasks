import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/current_prayer_entity.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/current_location.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/custom_jamea_background_container.dart';

import 'current_prayer.dart';

class CurrentPrayerSection extends StatelessWidget {
  const CurrentPrayerSection({
    super.key,
    required this.prayer,
  });
  final CurrentPrayerEntity prayer;
  @override
  Widget build(BuildContext context) {
    return CustomJameaBackgroundContainer(
      color: prayer.color,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 41,
          ),
          const Text(
            'Prayers Times',
            style: AppStyles.semiBoldHanken19,
          ),
          const SizedBox(
            height: 26,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: CurrentLocation(),
          ),
          const SizedBox(
            height: 30,
          ),
          CurrentPrayer(
            prayerName: prayer.name,
            time: prayer.time,
            period: prayer.period,
          ),
        ],
      ),
    );
  }
}
