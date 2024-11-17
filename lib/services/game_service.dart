import 'dart:async';
import 'dart:ui';

import '../core/mixins/game_bounds_mixin.dart';
import '../core/models/particle_model.dart';
import '../core/models/player_model.dart';
import '../shared/app_constants.dart';

abstract class IGameService with GameBoundsMixin {
  PlayerModel get player;
  set player(PlayerModel value);

  Stream<List<ParticleModel>> get particlesStream;

  void createParticles();

  void moveParticles();
}

class GameService extends IGameService {
  PlayerModel _player = AppConstants.defaultPlayer;
  @override
  PlayerModel get player => _player;
  @override
  set player(PlayerModel value) => _player = value;

  final _particlesSC = StreamController<List<ParticleModel>>.broadcast();
  @override
  Stream<List<ParticleModel>> get particlesStream => _particlesSC.stream;

  final particles = <ParticleModel>[];

  @override
  void createParticles() {
    for (var i = 0; i < AppConstants.particleCount; i++) {
      particles.add(ParticleModel.initial(screenSize));
    }
    _particlesSC.add(particles);
  }

  @override
  void moveParticles() {
    for (var i = 0; i < particles.length; i++) {
      ParticleModel particle = particles[i];

      if (!particle.isWithinBounds(screenSize)) {
        particles[i] = particle.copyWith(
          velocity: particle.mirrorWithinBounds(screenSize),
        );
        particle = particles[i];
      }

      Offset update = particle.position + particle.velocity;
      particles[i] = particle.copyWith(position: update);
    }
    _particlesSC.add(particles);

    // handleCollision();
  }
}
