import 'package:flutter/material.dart';
import 'package:we_pray_tasks/constants.dart';
import 'package:we_pray_tasks/core/utils/app_images.dart';

class PrayersHeaderBackground extends StatelessWidget {
  const PrayersHeaderBackground({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kSecondaryColor,
        image: DecorationImage(
          image: AssetImage(Assets.imagesJameaPng),
          fit: BoxFit.fill,
        ),
      ),
      width: double.infinity,
      child: child,
    );
  }
}
