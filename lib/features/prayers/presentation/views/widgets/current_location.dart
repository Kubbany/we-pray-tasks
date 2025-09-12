import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/cubits/location_cubit/location_cubit.dart';
import 'package:we_pray_tasks/core/utils/widgets/location_city_name.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({
    super.key,
  });

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
        return InkWell(
          onTap: () {
            context.read<LocationCubit>().resetCachedLocation();
            context.read<LocationCubit>().getCityName();
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: LocationCityName(
              color: Colors.white,
              text: text,
            ),
          ),
        );
      },
    );
  }
}
