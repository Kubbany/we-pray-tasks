import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';

class CurrentPrayer extends StatelessWidget {
  const CurrentPrayer({
    super.key,
    required this.prayerName,
    required this.time,
    required this.period,
  });

  final String prayerName;
  final String time;
  final String period;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Text(
          prayerName,
          style: AppStyles.regularHanken28,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: time,
                style: AppStyles.mediumSans32,
              ),
              TextSpan(
                text: period,
                style: AppStyles.mediumSans24,
              ),
            ],
          ),
        )
      ],
    );
  }
}
