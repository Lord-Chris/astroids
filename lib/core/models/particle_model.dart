import 'dart:ui';

class ParticleModel {
  const ParticleModel({
    required this.position,
    required this.velocity,
    required this.size,
  });

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
        width: size,
        height: size,
      );
}
