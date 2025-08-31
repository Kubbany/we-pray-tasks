import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/qibla_degree_direction_bloc_builder.dart';

class QiblaDegreeDicrection extends StatelessWidget {
  const QiblaDegreeDicrection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const QiblaDirectionBlocBuilder(),
        Text(
          'Rotate your phone to get your qibla direction',
          style: AppStyles.medium14,
        ),
      ],
    );
  }
}
