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
        return Listener(
          onPointerUp: (value) => gameNotifier.shootBullet(),
          onPointerMove: (event) {
            gameNotifier.updatePlayerPosition(event.localPosition);
          },
          child: MouseRegion(
            onHover: (event) {
              gameNotifier.updatePlayerPosition(event.localPosition);
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
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
                Positioned.fromRect(
                  rect: state.player.outerBounds,
                  child: Transform.rotate(
                    angle: state.playerDirection,
                    child: Icon(
                      Icons.label,
                      size: state.player.size,
                      color: context.cScheme.onBackground,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
