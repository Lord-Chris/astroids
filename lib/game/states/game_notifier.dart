import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/models/particle_model.dart';
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
  StreamSubscription<List<ParticleModel>>? _particlesSS;
  StreamSubscription<List<ParticleModel>>? _bulletsSS;
  Timer? _timer;

  void updateScreenBounds(Size screenSize) {
    _gameService.updateGameBounds(screenSize);
  }

  void initializeGame() {
    value = value.copyWith(state: GameState.starting);
  }

  void startGame() {
    _gameService.createParticles();
    value = value.copyWith(
      state: GameState.playing,
      startTime: () => DateTime.now(),
      endTime: () => null,
    );

    _timer = Timer.periodic(
      const Duration(milliseconds: 16),
      (_) {
        moveParticles();
        moveBullets();
      },
    );

    _particlesSS = _gameService.particlesStream.listen((event) {
      value = value.copyWith(particles: event);
      notifyListeners();
    });

    _bulletsSS = _gameService.bulletsStream.listen((event) {
      value = value.copyWith(bullets: event);
      notifyListeners();
    });
  }

  void updatePlayerPosition(Offset localPosition) {
    _gameService.player = _gameService.player.copyWith(position: localPosition);
    value = value.copyWith(
      player: _gameService.player,
      playerDirection: _gameService.playerDirection,
    );
  }

  void moveParticles() {
    _gameService.moveParticles(endGame);
  }

  void shootBullet() {
    _gameService.createBullet();
  }

  void moveBullets() {
    _gameService.moveBullets();
  }

  void endGame() {
    value = value.copyWith(
      state: GameState.ended,
      endTime: () => DateTime.now(),
    );
    _timer?.cancel();
    _particlesSS?.cancel();
    _bulletsSS?.cancel();
    _gameService.resetGame();
  }

  @override
  void dispose() {
    _particlesSS?.cancel();
    _bulletsSS?.cancel();
    _timer?.cancel();
    super.dispose();
    _instance = null;
  }
}
