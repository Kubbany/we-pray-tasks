import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:we_pray_tasks/core/helpers/on_generate_route.dart';
import 'package:we_pray_tasks/core/utils/service_locator.dart';
import 'package:we_pray_tasks/features/prayers/domain/entities/prayer_entity.dart';
import 'package:we_pray_tasks/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(PrayerEntityAdapter());
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
      initialRoute: Home.routeName,
    );
  }
}
