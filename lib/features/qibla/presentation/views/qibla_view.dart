import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/repos/location_repo/location_repo.dart';
import 'package:we_pray_tasks/core/utils/service_locator.dart';
import 'package:we_pray_tasks/features/qibla/domain/repos/qibla_repo.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/qibla_view_body.dart';

import '../manager/qibla_cubit/qibla_cubit.dart';

class QiblaView extends StatelessWidget {
  const QiblaView({super.key});
  static const String routeName = '/qibla';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QiblaCubit(
        getIt.get<QiblaRepo>(),
        getIt.get<LocationRepo>(),
      ),
      child: const Scaffold(
        backgroundColor: Color(0xFF28B16D),
        body: QiblaViewBody(),
      ),
    );
  }
}
