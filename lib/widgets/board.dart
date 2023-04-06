import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:racha_cuca_numeros/models/board_model.dart';
import 'line_board.dart';

class Board extends StatelessWidget {
  final int seconds;
  final Function onPositionItem;
  final BoardModel boardModel;
  final Color color = Colors.blue;

  const Board({
    super.key,
    required this.seconds,
    required this.onPositionItem,
    required this.boardModel,
  });
  //
  @override
  Widget build(BuildContext context) {
    const double heightBoard = 68 * 4 + 18 + 16;

    return Animate(
      effects: const [
        ScaleEffect(
          duration: Duration(milliseconds: 300),
        )
      ],
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width - 32,
        height: heightBoard,
        child: Column(
          children: [
            LineBoard(
              onTap: onPositionItem,
              values: boardModel.listItems.sublist(0, 4),
              color: color,
            ),
            LineBoard(
              onTap: onPositionItem,
              values: boardModel.listItems.sublist(4, 8),
              color: color,
            ),
            LineBoard(
              onTap: onPositionItem,
              values: boardModel.listItems.sublist(8, 12),
              color: color,
            ),
            LineBoard(
              onTap: onPositionItem,
              values: boardModel.listItems.sublist(12),
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
