import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';
import '../states/game_notifier.dart';

class PlayingGameView extends StatelessWidget {
  const PlayingGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: MouseMovementWidget()),
      ],
    );
  }
}

class MouseMovementWidget extends StatelessWidget {
  const MouseMovementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final gameNotifier = GameNotifier();
    return ValueListenableBuilder(
      valueListenable: gameNotifier,
      builder: (context, state, _) {
        return MouseRegion(
          onHover: (event) {
            gameNotifier.updatePlayerPosition(event.localPosition);
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fromRect(
                rect: state.player.outerBounds,
                child: const CircleAvatar(backgroundColor: AppColors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
