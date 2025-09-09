import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';

class LocationAccessDialogue extends StatelessWidget {
  const LocationAccessDialogue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        Text(
          'Location Access',
          style: AppStyles.semiBoldHanken19.copyWith(color: Colors.black),
        ),
        const Text(
          ' we need permission to access your location To Find Qibla Direction',
          style: AppStyles.regularHanken16,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
