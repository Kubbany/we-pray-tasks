import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 45),
      child: Center(
        child: Text(
          title,
          style: AppStyles.semiBoldHanken19,
        ),
      ),
    );
  }
}
