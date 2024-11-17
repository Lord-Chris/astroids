import 'package:flutter/material.dart';

import '../../services/game_service.dart';
import 'game_state.dart';

class GameNotifier extends ValueNotifier<GameViewState> {
  static GameNotifier? _instance;
  factory GameNotifier([IGameService? gameService]) {
    _instance ??= GameNotifier._(gameService ?? GameService());
    return _instance!;
  }

  GameNotifier._(this._gameService)
      : super(GameViewState(player: _gameService.player));

  final IGameService _gameService;

  void startGame() {
    value = value.copyWith(state: GameState.playing);
  }

  void updatePlayerPosition(Offset localPosition) {
    _gameService.player = _gameService.player.copyWith(position: localPosition);
    value = value.copyWith(player: _gameService.player);
  }

  @override
  void dispose() {
    super.dispose();
    _instance = null;
  }
}
