import 'package:flutter/material.dart';

import '../../core/extensions/context_extension.dart';
import '../../shared/_constants.dart';

class StartingGameView extends StatelessWidget {
  const StartingGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
            const Text(
              'Game will start in:\n3',
              style: AppTextStyles.semibold32,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
