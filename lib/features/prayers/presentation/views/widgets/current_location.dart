import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/widgets/location_city_name.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: LocationCityName(
        color: Colors.white,
        text: 'California, United States',
      ),
    );
  }
}
