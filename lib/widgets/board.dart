import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:racha_cuca_numeros/models/board_model.dart';
import 'package:racha_cuca_numeros/widgets/timeboard.dart';

import '../models/item.dart';
import 'line_board.dart';

class Board extends StatefulWidget {
  final int seconds;
  final _boardModel = BoardModel.reorderList();
  Board({super.key, required this.seconds});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  //
  Color _color = Colors.blue;
  late int _seconds = widget.seconds;
  bool _start = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    _seconds = widget.seconds;

    //
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_start) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  //
  void alterPositionItem(Item item) {
    if (_start) {
      if (widget._boardModel.alterPosition(item)) {
        setState(() {});
      }
    }
  }

  // Obtem o estado do jogo
  String getStateGame() {
    String result = '';
    if (widget._boardModel.isSequenceValid()) {
      setState(() {
        _start = false;
      });
      result = 'Correto parabéns para você';
    } else if (_seconds == 0) {
      result = 'Não foi desta vez, tente novamente';
    } else {
      result = '';
    }
    return result;
  }

  //
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Colors.green,
        );
    const double heightBoard = 68 * 4 + 18 + 16;

    return Column(
      children: [
        Timeboard(seconds: _seconds),
        Animate(
          effects: const [
            ScaleEffect(
              duration: Duration(milliseconds: 300),
            )
          ],
          child: Container(
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width - 32,
            height: heightBoard,
            child: Column(
              children: [
                LineBoard(
                  onTap: alterPositionItem,
                  values: widget._boardModel.listItems.sublist(0, 4),
                  color: _color,
                ),
                LineBoard(
                  onTap: alterPositionItem,
                  values: widget._boardModel.listItems.sublist(4, 8),
                  color: _color,
                ),
                LineBoard(
                  onTap: alterPositionItem,
                  values: widget._boardModel.listItems.sublist(8, 12),
                  color: _color,
                ),
                LineBoard(
                  onTap: alterPositionItem,
                  values: widget._boardModel.listItems.sublist(12),
                  color: _color,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: SizedBox(
            width: double.maxFinite,
            height: 64,
            child: FittedBox(
              child: Text(
                getStateGame(),
                style: textStyle,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 16),
          width: double.maxFinite,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(12),
              backgroundColor: _color,
            ),
            onPressed: _start
                ? null
                : () {
                    setState(() {
                      _start = true;
                    });
                  },
            icon: const Icon(Icons.gamepad),
            label: Text(
              'INICIAR JOGO !',
              style: GoogleFonts.play(),
            ),
          ),
        ),
      ],
    );
  }
}
