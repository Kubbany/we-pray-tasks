import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/features/qibla/presentation/manager/qibla_cubit/qibla_cubit.dart';

import 'qibla_compass.dart';

class QiblaCompassBlocConsumer extends StatelessWidget {
  const QiblaCompassBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QiblaCubit, QiblaState>(
      listener: (context, state) {
        if (state is QiblaFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        double targetRotation = 0.0;

        if (state is QiblaSuccess) {
          final double degreeDifference = ((state.qiblaDirection - state.heading + 540) % 360) - 180;

          targetRotation = degreeDifference * (pi / 180);
        }

        return QiblaCompass(
          targetRotation: targetRotation,
        );
      },
    );
  }
}
