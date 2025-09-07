import 'package:flutter/material.dart';
import 'package:we_pray_tasks/constants.dart';
import 'package:we_pray_tasks/core/utils/app_images.dart';

class CustomJameaBackgroundContainer extends StatelessWidget {
  const CustomJameaBackgroundContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.915,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: kSecondaryColor,
          image: DecorationImage(
            image: AssetImage(
              Assets.imagesJameaPng,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      ),
    );
  }
}
