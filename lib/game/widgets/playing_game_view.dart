import 'package:flutter/material.dart';

import 'particle_zone.dart';
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
