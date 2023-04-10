import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:racha_cuca_numeros/constants/assets_const.dart';
import 'package:racha_cuca_numeros/constants/routes.dart';
import 'package:racha_cuca_numeros/theme/gradients.dart';
import 'package:racha_cuca_numeros/utils/timer_utils.dart';

const title = 'Você escolheu a dificuldade';
const descriptionFrase1 = 'Você terá ';
const descriptionFrase2 =
    ' para completar o desafio, quanto mais rápido completar mais pontos você ganhará.';
const goodLock = 'Boa sorte!';
const goBack = 'Retornar';
const goGame = 'Jogar';

class DifficultyConfirmationScreen extends StatelessWidget {
  final int difficulty;
  const DifficultyConfirmationScreen({super.key, required this.difficulty});

  String getDifficultyName() {
    const noneDifficulty = 'Nenhuma';
    const easy = 'Fácil';
    const normal = 'Normal';
    const hard = 'Dificil';
    switch (difficulty) {
      case 0:
        return noneDifficulty;
      case 1:
        return easy;
      case 2:
        return normal;
      case 3:
      default:
        return hard;
    }
  }

  String getTimeDifficulty() {
    int seconds = TimerUtils().getTimeSeconds(difficulty);
    return TimerUtils().getTimeFormat(seconds);
  }

  String getDescription() {
    final description = StringBuffer();
    description.write(descriptionFrase1);
    description.write(getTimeDifficulty());
    description.write(descriptionFrase2);

    return description.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffbdc3c7), Color(0xffbdc3c7), ...gradientSplash],
          )),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.play(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(getDifficultyName(),
                  style: GoogleFonts.orbitron(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
              const SizedBox(height: 16),
              Image.asset(
                assetLevelDifficulty,
                color: const Color(0xffbdc3c7),
                colorBlendMode: BlendMode.multiply,
              ),
              const SizedBox(height: 48),
              Text(
                getDescription(),
                textAlign: TextAlign.center,
                style: GoogleFonts.play(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                goodLock,
                style: GoogleFonts.play(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_left_sharp),
                            label: const Text(goBack),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Animate(
                            onPlay: ((controller) => controller.repeat()),
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  routeNameGame,
                                  (route) => false,
                                  arguments: difficulty,
                                );
                              },
                              icon: const Icon(Icons.play_arrow),
                              label: const Text(goGame),
                            ),
                          ).shimmer(delay: const Duration(seconds: 3)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
