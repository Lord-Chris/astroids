import 'package:flutter/material.dart';

import '../../core/extensions/_extensions.dart';
import '../../shared/_constants.dart';
import '../states/game_notifier.dart';
import '../states/game_state.dart';

class EndedGameView extends StatelessWidget {
  const EndedGameView({super.key});

  @override
  Widget build(BuildContext context) {
    final gameNotifier = GameNotifier();
    return Padding(
      padding: EdgeInsets.all(context.screenSize.shortestSide * 0.1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'GAME OVER',
              style: AppTextStyles.bold60,
              textAlign: TextAlign.center,
            ),
            Spacing.vertRegular(),
            Text(
              'You lasted for ${gameNotifier.value.formattedDurationMessage}',
              style: AppTextStyles.medium24,
              textAlign: TextAlign.center,
            ),
            Spacing.vertLarge(),
            ElevatedButton(
              onPressed: gameNotifier.initializeGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.fromLTRB(48, 16, 48, 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Try Again',
                style: AppTextStyles.medium32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
