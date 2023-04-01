import 'package:flutter/material.dart';
import 'package:racha_cuca_numeros/screens/home_screen.dart';
import 'package:racha_cuca_numeros/screens/splash_scrren.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
