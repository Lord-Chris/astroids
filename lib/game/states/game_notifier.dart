import 'package:flutter/material.dart';

import 'game_state.dart';

class GameNotifier extends ValueNotifier<GameViewState> {
  GameNotifier._() : super(const GameViewState());

  static GameNotifier? _instance;

  factory GameNotifier() {
    _instance ??= GameNotifier._();
    return _instance!;
  }

  void startGame() {
    value = value.copyWith(state: GameState.playing);
  }

  @override
  void dispose() {
    super.dispose();
    _instance = null;
  }
}
