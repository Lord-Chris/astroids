import 'package:flutter/material.dart';

import '../../core/extensions/_extensions.dart';
import '../states/game_notifier.dart';

class PlayerZone extends StatefulWidget {
  const PlayerZone({super.key});

  @override
  State<PlayerZone> createState() => _PlayerZoneState();
}

class _PlayerZoneState extends State<PlayerZone> {
  final gameNotifier = GameNotifier();

  @override
  Widget build(BuildContext context) {
    final playerState = gameNotifier.value;

    return Listener(
      onPointerUp: (value) => gameNotifier.shootBullet(),
      onPointerMove: (event) {
        gameNotifier.updatePlayerPosition(event.localPosition);
        setState(() {});
      },
      child: MouseRegion(
        onHover: (event) {
          gameNotifier.updatePlayerPosition(event.localPosition);
          setState(() {});
        },
        cursor: SystemMouseCursors.none,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fromRect(
              rect: playerState.player.outerBounds,
              child: Transform.rotate(
                angle: playerState.playerDirection,
                child: Icon(
                  Icons.label,
                  size: playerState.player.size,
                  color: context.cScheme.onBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
