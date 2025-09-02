import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/core/utils/widgets/location_city_name.dart';
import 'package:we_pray_tasks/core/utils/cubits/location_cubit/location_cubit.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
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
          child: LocationCityName(text: text),
        ),
      ),
    );
  }
}
