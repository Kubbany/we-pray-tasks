import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/core/utils/cubits/location_cubit/location_cubit.dart';
import 'package:we_pray_tasks/features/qibla/presentation/manager/qibla_cubit/qibla_cubit.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/location_widget_bloc_builder.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/qibla_compass_bloc_consumer.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/qibla_degree_direction.dart';

class AllowedLocationWidget extends StatefulWidget {
  const AllowedLocationWidget({super.key});

  @override
  State<AllowedLocationWidget> createState() => _AllowedLocationWidgetState();
}

class _AllowedLocationWidgetState extends State<AllowedLocationWidget> {
  @override
  void initState() {
    super.initState();
    _startQiblaCompass();
  }

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

  Future<void> _startQiblaCompass() async {
    Future.microtask(
      () {
        if (mounted) {
          context.read<LocationCubit>().getCityName();
          context.read<QiblaCubit>().getQiblaDirection();
        }
      },
    );
  }
}
