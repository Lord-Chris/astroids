import 'package:flutter/material.dart';

import '../../core/extensions/_extensions.dart';
import '../states/game_notifier.dart';

class PlayerZone extends StatelessWidget {
  const PlayerZone({super.key});

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
                child: CircleAvatar(
                  backgroundColor: context.cScheme.onBackground,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
