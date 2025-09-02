import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_images.dart';

class JameaBackgroundStack extends StatelessWidget {
  const JameaBackgroundStack({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            bottom: MediaQuery.sizeOf(context).height * 0.472,
            child: Image.asset(
              Assets.imagesJameaPng,
              fit: BoxFit.fitWidth,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
