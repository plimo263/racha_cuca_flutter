import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:racha_cuca_numeros/constants/assets_const.dart';
import 'package:racha_cuca_numeros/constants/routes.dart';
import 'package:racha_cuca_numeros/theme/gradients.dart';

const title = 'Perdeu';
const description =
    'Não foi desta vez 😟, você não conseguiu fazer no tempo mínimo exigido.';
const tryAgain = 'Tentar novamente ?';
const buttonText = 'SIM, TENTAR OUTRA VEZ';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: gradientGameOver,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
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
                style: GoogleFonts.play(fontSize: 20),
              ),
              const SizedBox(height: 16),
              Image.asset(
                assetGameOver,
                color: const Color.fromARGB(255, 247, 213, 194),
                colorBlendMode: BlendMode.multiply,
              ),
              const SizedBox(height: 16),
              Text(
                tryAgain,
                style: GoogleFonts.orbitron(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(routeNameHome);
                },
                icon: const Icon(Icons.arrow_left),
                label: const Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
