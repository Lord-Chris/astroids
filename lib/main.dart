import 'package:flutter/material.dart';

import 'game/views/game_view.dart';
import 'shared/app_constants.dart';
import 'shared/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.theme,
      home: const GameView(),
    );
  }
}
