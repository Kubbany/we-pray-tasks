import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_images.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/angle_tween.dart';

class QiblaCompass extends StatelessWidget {
  const QiblaCompass({
    super.key,
    required this.targetRotation,
  });

  final double targetRotation;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.76,
        child: TweenAnimationBuilder<double>(
          tween: AngleTween(begin: 0, end: targetRotation),
          duration: const Duration(milliseconds: 200),
          builder: (context, animatedAngle, child) {
            return Transform.rotate(
              angle: animatedAngle,
              child: child,
            );
          },
          child: Image.asset(Assets.imagesQiblaCompass),
        ),
      ),
    );
  }
}
