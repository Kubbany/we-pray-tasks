import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/cubits/location_cubit/location_cubit.dart';
import 'package:we_pray_tasks/core/utils/methods/show_snack_bar_message.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/allow_location_prayers_widget.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/allowed_location_prayers_widgets.dart';

class PrayerBlocConsumer extends StatelessWidget {
  const PrayerBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listenWhen: (previous, current) => current is LocationPermissionFailure,
      listener: (context, state) {
        if (state is LocationPermissionFailure) {
          showSnackBarMessage(context, state.message);
        }
      },
      buildWhen: (previous, current) => current is LocationPermissionSuccess || current is LocationPermissionFailure,
      builder: (context, state) {
        if (state is LocationPermissionSuccess) {
          return const AllowedLocationPrayersWidget();
        } else {
          return const AllowLocationPrayersWidget();
        }
      },
    );
  }
}
