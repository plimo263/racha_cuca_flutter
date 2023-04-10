import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:racha_cuca_numeros/constants/assets_const.dart';
import 'package:racha_cuca_numeros/theme/gradients.dart';
import 'package:screenshot/screenshot.dart';

const title = 'Parabéns';
const description = 'Você completou o desafio com maestria';
const titlePoints = 'PONTUAÇÃO FINAL';
const phrasePoints = 'pontos';

class CongratulationsScreen extends StatelessWidget {
  final _screenshotController = ScreenshotController();
  final int secondsLeft;
  final int difficultyLevel;
  CongratulationsScreen({
    super.key,
    required this.secondsLeft,
    required this.difficultyLevel,
  });

  String getPoints() {
    return (secondsLeft * 10 * difficultyLevel).toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        //   actions: [
        //     IconButton(
        //       color: Colors.white,
        //       onPressed: () {
        //         // _screenshotController.capture().then((Uint8List? image) {
        //         //   if (image != null) {

        //         //   }
        //         // });
        //       },
        //       icon: const Icon(
        //         Icons.share,
        //       ),
        //     ),
        //   ],
        // ),
        body: Screenshot(
          controller: _screenshotController,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: gradientCongratulations,
                stops: [.6, 1],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: GoogleFonts.play(fontSize: 48),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.play(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                Image.asset(
                  assetVictory,
                  color: gradientCongratulations[0],
                  colorBlendMode: BlendMode.multiply,
                ),
                const SizedBox(height: 16),
                Text(
                  titlePoints,
                  style: GoogleFonts.play(fontSize: 20),
                ),
                const SizedBox(height: 8),
                Animate(
                  child: Text(
                    '${getPoints()} $phrasePoints',
                    style: GoogleFonts.orbitron(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPlay: (controller) => controller.repeat(),
                ).shimmer(
                  delay: const Duration(milliseconds: 2000),
                  duration: const Duration(seconds: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
