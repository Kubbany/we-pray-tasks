import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/service_locator.dart';
import 'package:we_pray_tasks/features/qibla/domain/repos/qibla_repo.dart';
import 'package:we_pray_tasks/features/qibla/presentation/manager/location_cubit/location_cubit.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/qibla_view_body.dart';

import '../manager/qibla_cubit/qibla_cubit.dart';

class QiblaView extends StatelessWidget {
  const QiblaView({super.key});
  static const String routeName = '/qibla';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationCubit(getIt.get<QiblaRepo>()),
        ),
        BlocProvider(
          create: (context) => QiblaCubit(getIt.get<QiblaRepo>())..getQiblaDirection(),
        ),
      ],
      child: const Scaffold(
        backgroundColor: Color(0xFF28B16D),
        body: QiblaViewBody(),
      ),
    );
  }
}
