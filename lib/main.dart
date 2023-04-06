import 'package:flutter/material.dart';
import 'package:racha_cuca_numeros/screens/difficulty_confirmation_screen.dart';
import 'package:racha_cuca_numeros/screens/game_screen.dart';
import 'package:racha_cuca_numeros/screens/home_screen.dart';
import 'package:racha_cuca_numeros/screens/splash_screen.dart';

import 'constants/routes.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.purple,
          foregroundColor: Colors.white,
        ),
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        final args = settings.arguments;

        switch (settings.name) {
          case routeNameDifficultyConfirmation:
            int difficulty = args != null ? args as int : 0;
            return MaterialPageRoute(
                builder: (context) =>
                    DifficultyConfirmationScreen(difficulty: difficulty));
          case routeNameHome:
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          case routeNameGame:
            int difficulty = args != null ? args as int : 0;
            return MaterialPageRoute(
                builder: (context) => GameScreen(
                      difficulty: difficulty,
                    ));
          case routeNameSplash:
          default:
            return MaterialPageRoute(
                builder: (context) => const SplashScreen());
        }
      },
      initialRoute: routeNameSplash,
    );
  }
}
