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

  const GameViewState({
    this.state = GameState.playing,
    this.gameDuration = const Duration(minutes: 5),
    required this.player,
  });

  GameViewState copyWith({
    GameState? state,
    Duration? gameDuration,
    PlayerModel? player,
  }) {
    return GameViewState(
      state: state ?? this.state,
      gameDuration: gameDuration ?? this.gameDuration,
      player: player ?? this.player,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameViewState &&
        other.state == state &&
        other.gameDuration == gameDuration &&
        other.player == player;
  }

  @override
  int get hashCode => state.hashCode ^ gameDuration.hashCode ^ player.hashCode;
}
