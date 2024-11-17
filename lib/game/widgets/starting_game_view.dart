import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';
import '../../shared/_constants.dart';
import '../states/game_notifier.dart';

class StartingGameView extends StatefulWidget {
  const StartingGameView({super.key});

  @override
  State<StartingGameView> createState() => _StartingGameViewState();
}

class _StartingGameViewState extends State<StartingGameView> {
  int _countdown = 3;
  Timer? _timer;
  final gameNotifier = GameNotifier();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_countdown == 0) {
          timer.cancel();
          gameNotifier.startGame();
        } else {
          setState(() => _countdown--);
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() => _countdown = 3);
        gameNotifier.updatePlayerPosition(event.localPosition);
      },
      child: Padding(
        padding: EdgeInsets.all(context.screenSize.shortestSide * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Keep your mouse still for 3 seconds to start the game',
              style: AppTextStyles.medium16,
              textAlign: TextAlign.center,
            ),
            Spacing.vertLarge(),
            Text(
              'Game will start in:\n$_countdown',
              style: AppTextStyles.semibold32,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
