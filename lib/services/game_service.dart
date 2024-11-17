import 'dart:async';
import 'dart:ui';

import '../core/extensions/_extensions.dart';
import '../core/mixins/game_bounds_mixin.dart';
import '../core/mixins/player_path_mixin.dart';
import '../core/models/particle_model.dart';
import '../core/models/player_model.dart';
import '../shared/app_constants.dart';

abstract class IGameService with GameBoundsMixin, PlayerPathMixin {
  PlayerModel get player;
  set player(PlayerModel value);

  Stream<List<ParticleModel>> get particlesStream;

  void createParticles();

  void moveParticles(VoidCallback onCollision);

  void resetGame();
}

class GameService extends IGameService {
  PlayerModel _player = AppConstants.defaultPlayer;
  @override
  PlayerModel get player => _player;
  @override
  set player(PlayerModel value) {
    _player = value;
    updatePath(value.position);
  }

  final _particlesSC = StreamController<List<ParticleModel>>.broadcast();
  @override
  Stream<List<ParticleModel>> get particlesStream => _particlesSC.stream;

  final particles = <ParticleModel>[];

  @override
  void createParticles() {
    while (particles.length < AppConstants.particleCount) {
      final particle = ParticleModel.initial(screenSize);
      if (particle.outerBounds.overlaps(player.outerBounds + 20)) {
        continue;
      }
      particles.add(particle);
    }
    _particlesSC.add(particles);
  }

  @override
  void moveParticles(VoidCallback onCollision) {
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

    checkForCollision(onCollision);
  }

  void checkForCollision(VoidCallback onCollision) {
    for (var i = 0; i < particles.length; i++) {
      final particle = particles[i];
      if (particle.outerBounds.overlaps(player.outerBounds)) {
        onCollision();
        break;
      }
    }
  }

  @override
  void resetGame() {
    particles.clear();
    _particlesSC.add(particles);
    clearPath();
    _player = AppConstants.defaultPlayer;
  }
}
