import 'package:flutter/material.dart';

import '../states/game_notifier.dart';
import 'player_zone.dart';

class PlayingGameView extends StatelessWidget {
  const PlayingGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: ParticlesZone()),
        Positioned.fill(child: PlayerZone()),
      ],
    );
  }
}

class ParticlesZone extends StatelessWidget {
  const ParticlesZone({super.key});

  @override
  Widget build(BuildContext context) {
    final gameNotifier = GameNotifier();
    return ValueListenableBuilder(
      valueListenable: gameNotifier,
      child: const CircleAvatar(backgroundColor: Colors.red),
      builder: (context, state, child) {
        return Stack(
          fit: StackFit.expand,
          children: [
            for (var i = 0; i < state.particles.length; i++)
              Positioned.fromRect(
                rect: Rect.fromCenter(
                  center: state.particles[i].position,
                  width: state.particles[i].size,
                  height: state.particles[i].size,
                ),
                child: child!,
              ),
          ],
        );
      },
    );
  }
}
