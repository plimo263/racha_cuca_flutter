import 'package:flutter/material.dart';
import 'package:racha_cuca_numeros/widgets/board.dart';

class GameScreen extends StatelessWidget {
  final int difficulty;
  const GameScreen({
    super.key,
    required this.difficulty,
  });

  int getTimeSeconds() {
    switch (difficulty) {
      case 1:
        return 60 * 7;
      case 2:
        return 60 * 5;
      default: // Nivel 3
        return 60 * 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Board(seconds: getTimeSeconds()),
        ),
      ),
    );
  }
}
