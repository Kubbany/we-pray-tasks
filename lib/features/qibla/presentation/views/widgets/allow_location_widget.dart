import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_images.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/allow_location_access_button.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/location_access_dialgoue.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/location_widget.dart';

class AllowLocationWidget extends StatelessWidget {
  const AllowLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'To Find Qibla Direction',
          style: AppStyles.mediumHanken19,
        ),
        const SizedBox(
          height: 15,
        ),
        const LocationWidget(
          text: 'You Must Access Location',
          color: Color(0xFFF0F0F0),
        ),
        const SizedBox(
          height: 83,
        ),
        Image.asset(Assets.imagesLocationPng),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: LocationAccessDialogue(),
        ),
        const SizedBox(
          height: 24,
        ),
        const AllowLocationAccessButton(),
      ],
    );
  }
}
