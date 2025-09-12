import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_pray_tasks/features/prayers/presentation/managers/prayers_cubit/prayers_cubit.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/current_prayer_section_bloc_builder.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayers_time_section.dart';

class AllowedLocationPrayersWidget extends StatefulWidget {
  const AllowedLocationPrayersWidget({
    super.key,
  });

  @override
  State<AllowedLocationPrayersWidget> createState() => _AllowedLocationPrayersWidgetState();
}

class _AllowedLocationPrayersWidgetState extends State<AllowedLocationPrayersWidget> {
  @override
  void initState() {
    super.initState();
    _getPrayers();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CurrentPrayerSectionBlocBuilder(),
              Transform.translate(
                offset: Offset(0, -MediaQuery.sizeOf(context).height * 0.1208),
                child: const PrayersTimeSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _getPrayers() async {
    Future.microtask(
      () {
        if (mounted) {
          context.read<PrayersCubit>().getCurrentPrayer();
          context.read<PrayersCubit>().getPrayers(DateTime.now());
        }
      },
    );
  }
}
