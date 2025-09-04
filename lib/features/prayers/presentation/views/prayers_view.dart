import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/constants.dart';
import 'package:we_pray_tasks/core/utils/cubits/location_cubit/location_cubit.dart';
import 'package:we_pray_tasks/core/utils/repos/location_repo/location_repo.dart';
import 'package:we_pray_tasks/core/utils/service_locator.dart';
import 'package:we_pray_tasks/features/prayers/domain/repos/prayers_repo.dart';
import 'package:we_pray_tasks/features/prayers/presentation/managers/prayers_cubit/prayers_cubit.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayers_view_body.dart';

class PrayersView extends StatelessWidget {
  const PrayersView({super.key});
  static const routeName = '/prayers';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationCubit(
            getIt.get<LocationRepo>(),
          )..getCityName(),
        ),
        BlocProvider(
          create: (context) => PrayersCubit(
            getIt.get<PrayersRepo>(),
            getIt.get<LocationRepo>(),
          ),
        ),
      ],
      child: const Scaffold(
        backgroundColor: kSecondaryColor,
        body: PrayersViewBody(),
      ),
    );
  }
}
