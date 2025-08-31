import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/features/qibla/presentation/manager/location_cubit/location_cubit.dart';

import 'location_widget.dart';

class LocationWidgetBlocBuilder extends StatelessWidget {
  const LocationWidgetBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        String text;
        if (state is LocationLoading) {
          text = 'Getting your location...';
        } else if (state is LocationSuccess) {
          text = state.place;
        } else if (state is LocationFailure) {
          text = 'Couldn\'t get location';
        } else {
          text = 'Tap to get your location';
        }

        return LocationWidget(text: text);
      },
    );
  }
}
