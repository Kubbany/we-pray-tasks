import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/features/qibla/presentation/manager/qibla_cubit/qibla_cubit.dart';

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

class QiblaDirectionBlocBuilder extends StatelessWidget {
  const QiblaDirectionBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QiblaCubit, QiblaState>(
      builder: (context, state) {
        if (state is QiblaSuccess) {
          String text;
          final diff = ((state.qiblaDirection - state.heading) % 360);
          final degreeDifference = diff.toStringAsFixed(1);
          if (diff <= 7 || diff >= 353) {
            text = 'You are facing qibla';
          } else {
            text = 'Qibla $degreeDifference\' From North';
          }
          return Text(
            text,
            style: AppStyles.medium19,
          );
        } else if (state is QiblaFailure) {
          return Text(
            'Error loading Qibla direction',
            style: AppStyles.medium14.copyWith(color: Colors.red),
          );
        }
        return const SizedBox();
      },
    );
  }
}
