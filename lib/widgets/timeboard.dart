import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Timeboard extends StatelessWidget {
  final int seconds;
  const Timeboard({super.key, required this.seconds});

  String getTimeFormat() {
    var mins = (seconds ~/ 60);
    var secs = seconds % 60;

    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getTimeFormat(),
      style: GoogleFonts.orbitron(
        fontSize: Theme.of(context).textTheme.displayMedium!.fontSize,
      ),
    );
  }
}
