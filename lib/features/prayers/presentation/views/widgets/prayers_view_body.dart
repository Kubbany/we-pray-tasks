import 'package:flutter/material.dart';

import 'prayers_header_section.dart';

class PrayersViewBody extends StatelessWidget {
  const PrayersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        CurrentPrayerSection(),
      ],
    );
  }
}
