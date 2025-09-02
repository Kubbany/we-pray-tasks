import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/widgets/custom_body_container.dart';

class PrayersTimeSection extends StatelessWidget {
  const PrayersTimeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomBodyContainer(
      child: Column(
        children: [
          SizedBox(
            height: 37,
          ),
        ],
      ),
    );
  }
}
