enum GameState {
  starting,
  playing,
  paused,
  ended,
}

class GameViewState {
  final GameState state;
  final Duration gameDuration;

  const GameViewState({
    this.state = GameState.starting,
    this.gameDuration = const Duration(minutes: 5),
  });

  GameViewState copyWith({
    GameState? state,
    Duration? gameDuration,
  }) {
    return GameViewState(
      state: state ?? this.state,
      gameDuration: gameDuration ?? this.gameDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameViewState &&
        other.state == state &&
        other.gameDuration == gameDuration;
  }

  @override
  int get hashCode => state.hashCode ^ gameDuration.hashCode;
}
