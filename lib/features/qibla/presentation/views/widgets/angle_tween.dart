import 'dart:math';

import 'package:flutter/material.dart';

class AngleTween extends Tween<double> {
  AngleTween({super.begin, super.end});

  @override
  double lerp(double t) {
    final double startAngle = begin ?? 0.0;
    final double endAngle = end ?? 0.0;

    double rawDifference = endAngle - startAngle;

    double shortestDifference = (rawDifference + pi) % (2 * pi) - pi;

    return startAngle + shortestDifference * t;
  }
}
