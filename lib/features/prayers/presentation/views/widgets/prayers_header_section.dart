import 'package:flutter/material.dart';

import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/current_location.dart';
import 'current_prayer_bloc_builder.dart';

class CurrentPrayerSection extends StatelessWidget {
  const CurrentPrayerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        SizedBox(
          height: 84,
        ),
        Text(
          'Prayers Times',
          style: AppStyles.semiBoldHanken19,
        ),
        SizedBox(
          height: 26,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25),
          child: CurrentLocation(),
        ),
        SizedBox(
          height: 30,
        ),
        CurrentPrayerBlocBuilder(),
      ],
    );
  }
}
