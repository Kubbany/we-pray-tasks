import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/widgets/location_city_name.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.049,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.189,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFEEFBF3),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: LocationCityName(text: text),
    );
  }
}
