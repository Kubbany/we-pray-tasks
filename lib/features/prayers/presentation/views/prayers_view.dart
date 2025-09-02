import 'package:flutter/material.dart';
import 'package:we_pray_tasks/features/prayers/presentation/views/widgets/prayers_view_body.dart';

class PrayersView extends StatelessWidget {
  const PrayersView({super.key});
  static const routeName = '/prayers';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PrayersViewBody(),
    );
  }
}
