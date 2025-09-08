import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_images.dart';

class CustomJameaBackgroundContainer extends StatelessWidget {
  const CustomJameaBackgroundContainer({
    super.key,
    required this.child,
    required this.color,
  });
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.915,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          image: const DecorationImage(
            image: AssetImage(
              Assets.imagesJameaPng,
            ),
            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
          ),
        ),
        child: child,
      ),
    );
  }
}
