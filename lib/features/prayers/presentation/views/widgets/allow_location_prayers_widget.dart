import 'package:flutter/material.dart';
import 'package:we_pray_tasks/constants.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/core/utils/widgets/custom_body_container.dart';

class AllowLocationPrayersWidget extends StatelessWidget {
  const AllowLocationPrayersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: kPrimaryColor,
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 45,
            ),
            child: Text(
              'Prayers Times',
              style: AppStyles.semiBoldHanken19,
            ),
          ),
          Expanded(
            child: CustomBodyContainer(
              child: Center(
                child: Text(
                  'Allow Location to get Prayers Times',
                  style: AppStyles.semiBoldHanken16.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
