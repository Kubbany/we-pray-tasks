import 'package:flutter/material.dart';
import 'package:we_pray_tasks/core/helpers/on_generate_route.dart';
import 'package:we_pray_tasks/core/utils/service_locator.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/qibla_view.dart';

void main() {
  setupServiceLocator();
  runApp(const WePrayTasks());
}

class WePrayTasks extends StatelessWidget {
  const WePrayTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color(0xFF141414),
              displayColor: const Color(0xFF141414),
            ),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: QiblaView.routeName,
    );
  }
}
