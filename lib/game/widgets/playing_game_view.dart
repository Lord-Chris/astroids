import 'package:flutter/material.dart';

import '../../core/extensions/_extensions.dart';
import '../../shared/_constants.dart';
import '../states/game_notifier.dart';
import '../states/game_state.dart';
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
                child: const CircleAvatar(backgroundColor: Colors.red),
              ),
            for (var i = 0; i < state.bullets.length; i++)
              Positioned.fromRect(
                rect: Rect.fromCenter(
                  center: state.bullets[i].position,
                  width: state.bullets[i].size,
                  height: state.bullets[i].size,
                ),
                child: CircleAvatar(
                  backgroundColor: context.cScheme.onBackground,
                ),
              ),
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                'Timer: ${state.formattedDuration}',
                style: AppTextStyles.medium24,
              ),
            ),
          ],
        );
      },
    );
  }
}
