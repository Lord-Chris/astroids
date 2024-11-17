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
    return '$minutes minutes and $seconds seconds';
  }
}

class GameViewState {
  final GameState state;
  final PlayerModel player;
  final List<ParticleModel> particles;
  final double playerDirection;
  final DateTime? startTime;
  final DateTime? endTime;

  const GameViewState({
    this.state = GameState.starting,
    required this.player,
    this.particles = const [],
    this.playerDirection = 0.0,
    this.startTime,
    this.endTime,
  });

  GameViewState copyWith({
    GameState? state,
    PlayerModel? player,
    List<ParticleModel>? particles,
    double? playerDirection,
    ValueGetter<DateTime?>? startTime,
    ValueGetter<DateTime?>? endTime,
  }) {
    return GameViewState(
      state: state ?? this.state,
      player: player ?? this.player,
      particles: particles ?? this.particles,
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
        other.player == player &&
        listEquals(other.particles, particles) &&
        other.playerDirection == playerDirection &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode {
    return state.hashCode ^
        player.hashCode ^
        particles.hashCode ^
        playerDirection.hashCode ^
        startTime.hashCode ^
        endTime.hashCode;
  }
}
