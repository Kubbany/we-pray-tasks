import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/app_styles.dart';
import 'package:we_pray_tasks/features/qibla/presentation/manager/location_cubit/location_cubit.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

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
          log(state.message);
          text = 'Couldn\'t get location';
        } else {
          text = 'Tap to get your location';
        }

        return InkWell(
          onTap: () => context.read<LocationCubit>().getCityName(),
          child: Container(
            width: 229,
            height: MediaQuery.sizeOf(context).height * 0.049,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 20,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFEEFBF3),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: <Widget>[
                  const Icon(
                    Icons.location_on,
                    color: Color(0xFF262626),
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: AppStyles.medium14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
