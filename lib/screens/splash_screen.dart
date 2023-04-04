import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:racha_cuca_numeros/screens/home_screen.dart';

import '../constants/assets_const.dart';
import '../theme/gradients.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> redirectToHome(BuildContext context) async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((inContext) => const HomeScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    redirectToHome(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: gradientSplash,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Animate(
              effects: const [
                ScaleEffect(
                  delay: Duration(milliseconds: 200),
                  duration: Duration(
                    milliseconds: 400,
                  ),
                ),
              ],
              child: Image.asset(assetLogo),
            ),
            FittedBox(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Racha-Cuca',
                    textStyle: GoogleFonts.play(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
