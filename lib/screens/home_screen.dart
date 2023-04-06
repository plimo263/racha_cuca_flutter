import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:racha_cuca_numeros/constants/assets_const.dart';
import 'package:racha_cuca_numeros/constants/routes.dart';
import 'package:racha_cuca_numeros/constants/strings_const.dart';
import 'package:racha_cuca_numeros/theme/gradients.dart';
import 'package:racha_cuca_numeros/widgets/board.dart';

import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void selectedLevel(int level) {
    Navigator.of(context)
        .pushNamed(routeNameDifficultyConfirmation, arguments: level);
  }

  @override
  Widget build(BuildContext context) {
    final options = <Map<String, dynamic>>[
      {
        'text': buttonLevelEasy,
        'level': 1,
        'onPressed': () => selectedLevel(1),
      },
      {
        'text': buttonLevelNormal,
        'level': 2,
        'onPressed': () => selectedLevel(2),
      },
      {
        'text': buttonLevelHard,
        'level': 3,
        'onPressed': () => selectedLevel(3),
      },
    ];
    //
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientSplash,
          )),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Escolha uma dificuldade',
                style: GoogleFonts.play(
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 16),
              Animate(
                child: Image.asset(
                  assetLogo,
                  height: 173,
                ),
              ).animate().fade(
                    delay: const Duration(milliseconds: 300),
                    duration: const Duration(milliseconds: 300),
                  ),
              const SizedBox(height: 76),
              for (var optButton in options)
                Animate(
                  effects: [
                    ScaleEffect(
                      delay: Duration(
                        milliseconds: optButton['level'] * 200,
                      ),
                    ),
                  ],
                  child: ButtonLevel(
                    level: optButton['level'],
                    onPressed: optButton['onPressed'],
                    text: optButton['text'],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonLevel extends StatelessWidget {
  final int level;

  final VoidCallback onPressed;
  final String text;
  const ButtonLevel({
    super.key,
    required this.level,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double valuePadding = 8.0;
    final borderSide = BorderSide(
      width: 2.0,
      color: Theme.of(context).primaryColor,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: valuePadding),
      child: SizedBox(
        width: double.maxFinite,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(valuePadding),
            side: borderSide,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: GoogleFonts.play(
              fontSize: 28,
              //color: Colors.white,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}
