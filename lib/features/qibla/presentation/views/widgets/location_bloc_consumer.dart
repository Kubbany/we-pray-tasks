import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/cubits/location_cubit/location_cubit.dart';
import 'package:we_pray_tasks/core/utils/methods/show_snack_bar_message.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/allow_location_widget.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/widgets/allowed_location_widget.dart';

class LocationBlocConsumer extends StatelessWidget {
  const LocationBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is LocationFailure) {
          showSnackBarMessage(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is LocationPermissionSuccess) {
          return const AllowedLocationWidget();
        } else {
          return const AllowLocationWidget();
        }
      },
    );
  }
}
