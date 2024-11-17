import 'dart:math';
import 'dart:ui';

import '../../shared/_constants.dart';

extension PMExt on ParticleModel {
  bool isWithinBounds(Size bounds) {
    return position.dx >= 0 &&
        position.dx <= bounds.width &&
        position.dy >= 0 &&
        position.dy <= bounds.height;
  }

  Offset mirrorWithinBounds(Size size) {
    double newX = velocity.dx;
    double newY = velocity.dy;

    if (position.dx < 0 || position.dx > size.width) {
      newX = -velocity.dx;
    }

    if (position.dy < 0 || position.dy > size.height) {
      newY = -velocity.dy;
    }

    return Offset(newX, newY);
  }
}

class ParticleModel {
  const ParticleModel({
    required this.position,
    required this.velocity,
    required this.size,
  });

  factory ParticleModel.initial(Size screenSize) {
    final random = Random();
    return ParticleModel(
      position: Offset(
        screenSize.width * random.nextDouble(),
        screenSize.height * random.nextDouble(),
      ),
      velocity: Offset.fromDirection(
        random.nextDouble(),
        AppConstants.minParticleSpeed +
            random.nextInt(AppConstants.particleSpeedRange.toInt()),
      ),
      size: AppConstants.minParticleSize +
          random.nextInt(AppConstants.particleSizeRange.toInt()),
    );
  }

  factory ParticleModel.bullet(Offset position, Offset velocity) {
    return ParticleModel(
      position: position,
      size: AppConstants.bulletSize,
      velocity: Offset.fromDirection(
        velocity.direction,
        AppConstants.bulletVelocity,
      ),
    );
  }

  final Offset position;
  final Offset velocity;
  final double size;

  ParticleModel copyWith({
    Offset? position,
    Offset? velocity,
    double? size,
  }) {
    return ParticleModel(
      position: position ?? this.position,
      velocity: velocity ?? this.velocity,
      size: size ?? this.size,
    );
  }

  Rect get outerBounds => Rect.fromCenter(
        center: position,
        width: size - 2,
        height: size - 2,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ParticleModel &&
        other.position == position &&
        other.velocity == velocity &&
        other.size == size;
  }

  @override
  int get hashCode => position.hashCode ^ velocity.hashCode ^ size.hashCode;
}
