import 'dart:math';
import 'dart:ui';

import '../../shared/_constants.dart';
import '../utils/polygon_util.dart';

extension PMExt on ParticleModel {
  Rect get outerBounds => Rect.fromCenter(
        center: position,
        width: size - 2,
        height: size - 2,
      );

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
    this.vertices = const [],
  });

  factory ParticleModel.initial(Size screenSize) {
    final random = Random();
    List<Offset> points = [];
    final size = AppConstants.minParticleSize +
        random.nextInt(AppConstants.particleSizeRange.toInt());

    final position = Offset(
      screenSize.width * random.nextDouble(),
      screenSize.height * random.nextDouble(),
    );

    if (AppConstants.supportPolygons) {
      final sides = random.nextInt(5) + 2;

      for (int i = 0; i < sides; i++) {
        points.add(
          PolygonUtil.createVertex(
            Offset(size / 2, size / 2),
            size / 2,
            (360 / sides * i) + random.nextInt(100),
          ),
        );
      }
    }

    return ParticleModel(
      position: position,
      velocity: Offset.fromDirection(
        random.nextDouble(),
        AppConstants.minParticleSpeed +
            random.nextInt(AppConstants.particleSpeedRange.toInt()),
      ),
      size: size,
      vertices: points,
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
  final List<Offset> vertices;

  ParticleModel copyWith({
    Offset? position,
    Offset? velocity,
    double? size,
  }) {
    return ParticleModel(
      position: position ?? this.position,
      velocity: velocity ?? this.velocity,
      size: size ?? this.size,
      vertices: vertices,
    );
  }

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
