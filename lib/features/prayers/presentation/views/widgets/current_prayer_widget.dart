import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';

class CurrentPrayer extends StatelessWidget {
  const CurrentPrayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 20,
      children: [
        Text(
          'Isha',
          style: AppStyles.regularHanken28,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '8:30',
                style: AppStyles.mediumSans32,
              ),
              TextSpan(
                text: 'pm',
                style: AppStyles.mediumSans24,
              ),
            ],
          ),
        )
      ],
    );
  }
}
