import 'dart:math';

import 'package:flutter/material.dart';

abstract class PolygonUtil {
  PolygonUtil._();

  static Offset createVertex(Offset center, double radius, [double? degree]) {
    final random = Random();
    num angle;
    if (degree != null) {
      angle = degree * pi / 180;
    } else {
      angle = random.nextDouble() * 2 * pi;
    }

    final x = center.dx + radius * cos(angle);
    final y = center.dy + radius * sin(angle);

    return Offset(x, y);
  }
}
