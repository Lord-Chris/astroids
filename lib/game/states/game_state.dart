import '../../core/models/particle_model.dart';
import '../../core/models/player_model.dart';

enum GameState {
  starting,
  playing,
  paused,
  ended,
}

class GameViewState {
  final GameState state;
  final Duration gameDuration;
  final PlayerModel player;
  final List<ParticleModel> particles;

  const GameViewState({
    this.state = GameState.starting,
    this.gameDuration = const Duration(minutes: 5),
    required this.player,
    this.particles = const [],
  });

  GameViewState copyWith({
    GameState? state,
    Duration? gameDuration,
    PlayerModel? player,
    List<ParticleModel>? particles,
  }) {
    return GameViewState(
      state: state ?? this.state,
      gameDuration: gameDuration ?? this.gameDuration,
      player: player ?? this.player,
      particles: particles ?? this.particles,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameViewState &&
        other.state == state &&
        other.gameDuration == gameDuration &&
        other.player == player &&
        other.particles == particles;
  }

  @override
  int get hashCode =>
      state.hashCode ^
      gameDuration.hashCode ^
      player.hashCode ^
      particles.hashCode;
}
