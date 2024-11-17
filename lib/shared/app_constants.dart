import 'dart:ui';

import '../core/models/player_model.dart';

abstract class AppConstants {
  AppConstants._();

  static const String appName = 'Astroids';
  static const PlayerModel defaultPlayer = PlayerModel(
    position: Offset.zero,
    size: 20,
    velocity: Offset.zero,
  );
}
