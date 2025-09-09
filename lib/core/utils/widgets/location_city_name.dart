import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';

class LocationCityName extends StatelessWidget {
  const LocationCityName({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: color ?? const Color(0xFF262626),
        ),
        Expanded(
          child: Text(
            text,
            style: color != null ? AppStyles.semiBoldHanken16 : AppStyles.mediumSans14,
          ),
        ),
      ],
    );
  }
}
