import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/location_widget_bloc_builder.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/qibla_compass_bloc_consumer.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/qibla_degree_direction.dart';

class LocationAllowedWidget extends StatelessWidget {
  const LocationAllowedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text(
          'Find your qibla direction',
          style: AppStyles.mediumHanken19,
        ),
        SizedBox(
          height: 14,
        ),
        LocationWidgetBlocBuilder(),
        SizedBox(
          height: 68,
        ),
        QiblaCompassBlocConsumer(),
        SizedBox(
          height: 32,
        ),
        QiblaDegreeDicrection(),
      ],
    );
  }
}
