import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/timer_utils.dart';

class Timeboard extends StatelessWidget {
  final int seconds;
  const Timeboard({super.key, required this.seconds});

  @override
  Widget build(BuildContext context) {
    return Text(
      TimerUtils().getTimeFormat(seconds),
      style: GoogleFonts.orbitron(
        fontSize: Theme.of(context).textTheme.displayMedium!.fontSize,
      ),
    );
  }
}
