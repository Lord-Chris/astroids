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
  Stream<List<ParticleModel>> get bulletsStream;

  void createParticles();

  void moveParticles(VoidCallback onCollision);

  void resetGame();

  void createBullet();

  void moveBullets();
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

  final particles = <ParticleModel>[];
  final _particlesSC = StreamController<List<ParticleModel>>.broadcast();
  @override
  Stream<List<ParticleModel>> get particlesStream => _particlesSC.stream;

  final bullets = <ParticleModel>[];
  final _bulletsSC = StreamController<List<ParticleModel>>.broadcast();
  @override
  Stream<List<ParticleModel>> get bulletsStream => _bulletsSC.stream;

  void createParticle() {
    final particle = ParticleModel.initial(screenSize);
    if (particle.outerBounds.overlaps(player.outerBounds + 20)) return;

    particles.add(particle);
  }

  @override
  void createParticles() {
    while (particles.length < AppConstants.particleCount) {
      createParticle();
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

      for (var j = 0; j < bullets.length; j++) {
        final bullet = bullets[j];
        if (bullet.outerBounds.overlaps(particle.outerBounds)) {
          particles.removeAt(i);
          bullets.removeAt(j);
          _particlesSC.add(particles);
          _bulletsSC.add(bullets);
          Future.delayed(const Duration(seconds: 2), () => createParticle());
          break;
        }
      }
    }
  }

  @override
  void createBullet() {
    final bullet = ParticleModel.bullet(player.position, directionOffset);
    bullets.add(bullet);
    _bulletsSC.add(bullets);
  }

  @override
  void moveBullets() {
    for (var i = 0; i < bullets.length; i++) {
      ParticleModel bullet = bullets[i];

      if (!bullet.isWithinBounds(screenSize)) {
        bullets.removeAt(i);
        continue;
      }

      Offset update = bullet.position + bullet.velocity;
      bullets[i] = bullet.copyWith(position: update);
    }
    _bulletsSC.add(bullets);
  }

  @override
  void resetGame() {
    particles.clear();
    _particlesSC.add(particles);
    bullets.clear();
    _bulletsSC.add(bullets);
    clearPath();
    _player = AppConstants.defaultPlayer;
  }
}
