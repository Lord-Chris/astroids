import 'dart:ui';

import '../core/models/player_model.dart';

abstract class AppConstants {
  AppConstants._();

  static const appName = 'Astroids';
  static const defaultPlayer = PlayerModel(
    position: Offset.zero,
    size: 40,
  );

  static const particleCount = 10;

  static const minParticleSize = 20.0;
  static const maxParticleSize = 100.0;
  static const particleSizeRange = maxParticleSize - minParticleSize;

  static const minParticleSpeed = 1.0;
  static const maxParticleSpeed = 5.0;
  static const particleSpeedRange = maxParticleSpeed - minParticleSpeed;
}
