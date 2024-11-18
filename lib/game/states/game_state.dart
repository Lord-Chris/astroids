import 'package:flutter/foundation.dart';

import '../../core/models/particle_model.dart';
import '../../core/models/player_model.dart';

enum GameState {
  starting,
  playing,
  paused,
  ended,
}

extension GameViewStateExtension on GameViewState {
  Duration get gameDuration {
    switch (state) {
      case GameState.starting:
      case GameState.paused:
      case GameState.ended:
        return (endTime ?? DateTime.now())
            .difference(startTime ?? DateTime.now());
      case GameState.playing:
        return DateTime.now().difference(startTime ?? DateTime.now());
    }
  }

  String get formattedDuration {
    final duration = gameDuration;
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String get formattedDurationMessage {
    final duration = gameDuration;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '$minutes minute(s) and $seconds second(s)';
  }
}

class GameViewState {
  final GameState state;
  final PlayerModel player;
  final List<ParticleModel> particles;
  final List<ParticleModel> bullets;
  final double playerDirection;
  final DateTime? startTime;
  final DateTime? endTime;

  const GameViewState({
    this.state = GameState.starting,
    required this.player,
    this.particles = const [],
    this.bullets = const [],
    this.playerDirection = 0.0,
    this.startTime,
    this.endTime,
  });

  GameViewState copyWith({
    GameState? state,
    PlayerModel? player,
    List<ParticleModel>? particles,
    List<ParticleModel>? bullets,
    double? playerDirection,
    ValueGetter<DateTime?>? startTime,
    ValueGetter<DateTime?>? endTime,
  }) {
    return GameViewState(
      state: state ?? this.state,
      player: player ?? this.player,
      particles: particles ?? this.particles,
      bullets: bullets ?? this.bullets,
      playerDirection: playerDirection ?? this.playerDirection,
      startTime: startTime != null ? startTime() : this.startTime,
      endTime: endTime != null ? endTime() : this.endTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameViewState &&
        other.state == state &&
        listEquals(other.particles, particles) &&
        listEquals(other.bullets, bullets) &&
        other.playerDirection == playerDirection &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode {
    return state.hashCode ^
        particles.hashCode ^
        bullets.hashCode ^
        playerDirection.hashCode ^
        startTime.hashCode ^
        endTime.hashCode;
  }
}
