import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/constants.dart';
import 'package:we_pray_tasks/core/utils/cubits/location_cubit/location_cubit.dart';
import 'package:we_pray_tasks/core/utils/service_locator.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayers_view_body.dart';
import 'package:we_pray_tasks/features/qibla/domain/repos/qibla_repo.dart';

class PrayersView extends StatelessWidget {
  const PrayersView({super.key});
  static const routeName = '/prayers';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationCubit(getIt.get<QiblaRepo>())..getCityName(),
        ),
      ],
      child: const Scaffold(
        backgroundColor: kSecondaryColor,
        body: PrayersViewBody(),
      ),
    );
  }
}
