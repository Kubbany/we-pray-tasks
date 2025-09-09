import 'package:flutter/material.dart';
import 'package:we_pray_tasks/constants.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';

class AllowLocationAccessButton extends StatelessWidget {
  const AllowLocationAccessButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 28,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(
            Radius.circular(40),
          ),
        ),
      ),
      onPressed: () {},
      child: const Text(
        'Allow Location Access',
        style: AppStyles.boldHanken16,
      ),
    );
  }
}
