// import '../../core/models/particle_model.dart';
// import 'game_notifier.dart';

// mixin ParticlesMixin on GameNotifier {
//   List<ParticleModel> particles = [];

//   void moveParticles() {
//     for (var i = 0; i < particles.length; i++) {
//       final particle = particles[i];

//       if (!particle.position.isWithinBounds(screenSize)) {
//         particles[i] = particle.copyWith(
//           velocity: particle.velocity
//               .mirrorWithinBound(screenSize, particle.position),
//         );
//       }

//       Offset update = particles[i].position + particles[i].velocity;
//       particles[i] = particles[i].copyWith(position: update);
//     }
//     _particlesSC.add(particles);

//     handleCollision();
//   }

//   void handleCollision() {
//     for (var i = 0; i < particles.length; i++) {
//       final particle = particles[i];
//       if (particle.outerBounds.overlaps(playerBounds)) {
//         particles.removeAt(i);
//         _particlesSC.add(particles);
//       }
//     }
//   }
// }
