import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';
import '../states/game_notifier.dart';
import '../states/game_state.dart';
import '../widgets/ended_game_view.dart';
import '../widgets/starting_game_view.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameNotifier provider;

  @override
  void initState() {
    super.initState();
    provider = GameNotifier();
  }

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const GameView();
  }
}

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GameNotifier(),
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: AppColors.black,
          body: Builder(builder: (context) {
            if (state.state == GameState.starting) {
              return const StartingGameView();
            }
            return const EndedGameView();
          }),
        );
      },
    );
  }
}
