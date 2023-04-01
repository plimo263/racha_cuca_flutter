import 'dart:math';

import 'package:flutter/material.dart';
import 'package:racha_cuca_numeros/models/board_model.dart';

import '../models/item.dart';
import 'line_board.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final _boardModel = BoardModel();
  //
  @override
  void initState() {
    super.initState();
  }

  //
  void alterPositionItem(Item item) {
    if (_boardModel.alterPosition(item)) {
      setState(() {});
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Colors.green,
        );
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width - 32,
          height: 68 * 4 + 18 + 16,
          child: Column(
            children: [
              LineBoard(
                  onTap: alterPositionItem,
                  values: _boardModel.listItems.sublist(0, 4)),
              LineBoard(
                  onTap: alterPositionItem,
                  values: _boardModel.listItems.sublist(4, 8)),
              LineBoard(
                  onTap: alterPositionItem,
                  values: _boardModel.listItems.sublist(8, 12)),
              LineBoard(
                  onTap: alterPositionItem,
                  values: _boardModel.listItems.sublist(12)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
            width: double.maxFinite,
            height: 64,
            child: FittedBox(
              child: Text(
                _boardModel.isSequenceValid()
                    ? 'Correto parabéns para você'
                    : '',
                style: textStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
