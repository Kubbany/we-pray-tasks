import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/widgets/custom_body_container.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/allow_location_widget.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/header_widget.dart';

class QiblaViewBody extends StatelessWidget {
  const QiblaViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        HeaderWidget(title: 'Qibla Compass'),
        Expanded(
          child: CustomBodyContainer(
            child: AllowLocationWidget(),
          ),
        ),
      ],
    );
  }
}
