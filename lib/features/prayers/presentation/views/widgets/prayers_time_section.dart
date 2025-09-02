import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/widgets/custom_body_container.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/date_picker.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayer_time_list_view.dart';

class PrayersTimeSection extends StatelessWidget {
  const PrayersTimeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBodyContainer(
      child: Column(
        spacing: 50,
        children: [
          DatePicker(
            onDateChanged: (date) {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PrayerTimeListView(),
          ),
        ],
      ),
    );
  }
}
