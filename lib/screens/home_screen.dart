import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
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
  int _levelValue = 0;

  List<Color> getGradientColor() {
    switch (_levelValue) {
      case 1:
        return gradientEasyLevel;
      case 2:
        return gradientNormalLevel;
      case 3:
        return gradientHardLevel;
      default:
        return gradientSplash;
    }
  }

  @override
  Widget build(BuildContext context) {
    final options = <Map<String, dynamic>>[
      {
        'text': buttonLevelEasy,
        'level': 1,
        'isSelected': _levelValue == 1,
        'onPressed': () => setState(() => _levelValue = 1),
      },
      {
        'text': buttonLevelNormal,
        'level': 2,
        'isSelected': _levelValue == 2,
        'onPressed': () => setState(() => _levelValue = 2),
      },
      {
        'text': buttonLevelHard,
        'level': 3,
        'isSelected': _levelValue == 3,
        'onPressed': () => setState(() => _levelValue = 3),
      },
    ];
    //
    return Scaffold(
      body: SafeArea(
        child: Container(
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: getGradientColor(),
          // )),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text('Escolha uma dificuldade'),
              for (var optButton in options)
                Animate(
                  effects: [
                    FadeEffect(
                      delay: Duration(
                        milliseconds: optButton['level'] * 200,
                      ),
                    ),
                  ],
                  child: ButtonLevel(
                    level: optButton['level'],
                    isSelected: optButton['isSelected'],
                    onPressed: optButton['onPressed'],
                    text: optButton['text'],
                  ),
                ),
              AnimatedCrossFade(
                firstChild: const SizedBox(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(32),
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => GameScreen(
                              difficulty: _levelValue,
                            ),
                          ),
                        );
                      },
                      child: const Text('Começar'),
                    ),
                  ),
                ),
                crossFadeState: _levelValue > 0
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
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
  final bool isSelected;
  final VoidCallback onPressed;
  final String text;
  const ButtonLevel({
    super.key,
    required this.level,
    required this.isSelected,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.maxFinite,
        child: isSelected
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  side: BorderSide(
                    width: 2.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  text,
                  style: GoogleFonts.play(
                    fontSize: 28,
                    letterSpacing: 2,
                  ),
                ),
              )
            : OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  side: BorderSide(
                    width: 2.0,
                    color: Theme.of(context).primaryColor,
                  ),
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
