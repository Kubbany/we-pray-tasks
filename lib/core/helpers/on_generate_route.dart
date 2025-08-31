import 'package:flutter/material.dart';
import 'package:we_pray_tasks/features/qibla/presentation/views/qibla_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case QiblaView.routeName:
      return MaterialPageRoute(builder: (context) => const QiblaView());

    default:
      return MaterialPageRoute(builder: (context) => const Placeholder());
  }
}
