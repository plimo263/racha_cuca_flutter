import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:racha_cuca_numeros/constants/routes.dart';
import 'package:racha_cuca_numeros/utils/timer_utils.dart';
import 'package:racha_cuca_numeros/widgets/board.dart';

import '../models/board_model.dart';
import '../models/item.dart';
import '../theme/gradients.dart';

class GameScreen extends StatefulWidget {
  final int difficulty;
  final _boardModel = BoardModel.reorderList();
  GameScreen({
    super.key,
    required this.difficulty,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late int _seconds;
  bool _start = true;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _seconds = TimerUtils().getTimeSeconds(widget.difficulty);
    //
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_start) {
        if (_seconds == 0) {
          // Possivelmente não conseguiu ganhar envia-lo para tela de derrota
          Navigator.of(context).pushReplacementNamed(routeNameGameOver);
          return;
        }
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          }
        });
      }
    });
  }

  //
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  //
  void alterPositionItem(Item item) {
    if (_start) {
      if (widget._boardModel.alterPosition(item)) {
        // Verifica se conseguiu ganhar o jogo
        if (widget._boardModel.isSequenceValid()) {
          Map<String, int> dataGamePoints = {
            'seconds': _seconds,
            'difficulty': widget.difficulty,
          };
          Navigator.of(context).pushReplacementNamed(
            routeNameCongratulations,
            arguments: dataGamePoints,
          );
        } else {
          setState(() {});
        }
      }
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: Colors.white,
            iconSize: 36,
            padding:
                const EdgeInsets.only(right: 16, left: 8, bottom: 8, top: 8),
            onPressed: () {
              setState(() {
                _start = !_start;
              });
            },
            icon: Icon(
              _start ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          TimerUtils().getTimeFormat(_seconds),
          style: GoogleFonts.orbitron(
            fontSize: 36,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientSplash,
        )),
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Board(
            boardModel: widget._boardModel,
            seconds: _seconds,
            onPositionItem: alterPositionItem,
          ),
        ),
      ),
    );
  }
}
