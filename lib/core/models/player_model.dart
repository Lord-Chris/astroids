import 'dart:ui';

class PlayerModel {
  const PlayerModel({
    required this.position,
    required this.size,
  });

  final Offset position;
  final double size;

  PlayerModel copyWith({
    Offset? position,
    double? size,
  }) {
    return PlayerModel(
      position: position ?? this.position,
      size: size ?? this.size,
    );
  }

  Rect get outerBounds => Rect.fromCenter(
        center: position,
        width: size - 2,
        height: size - 2,
      );
}
