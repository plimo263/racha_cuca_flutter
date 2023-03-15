import 'dart:math';

import 'package:flutter/material.dart';

import '../models/item.dart';
import 'line_board.dart';

final blankItem = Item('${Item.getLetter(15)}${15 + 1}', 15, true);

final initSequence = List.generate(
  15,
  (index) => Item('${Item.getLetter(index)}${index + 1}', index),
).toList();

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<Item> correctSequence = [...initSequence, blankItem];
  List<Item> listItems = initSequence..shuffle();

  //
  @override
  void initState() {
    super.initState();
    reorderList();
  }

  //
  void reorderList() {
    final newItems = <Item>[];
    for (int i = 0; i < listItems.length; i++) {
      listItems[i].position = i;
      newItems.add(listItems[i]);
    }
    // Adicionando o item branco
    newItems.add(blankItem);
    listItems = newItems;
  }

  //
  bool isSequenceValid() {
    bool isEqual = true;
    for (int i = 0; i < correctSequence.length; i++) {
      if (correctSequence[i].id != listItems[i].id) {
        isEqual = false;
        break;
      }
    }
    return isEqual;
  }

  //
  void alterPosition(Item item) {
    final itemBlank = listItems.firstWhere((Item item) => item.isBlank);

    if (itemBlank.isSwapPosition(item.position)) {
      // Vamos criar uma nova lista e reposicionar os itens
      setState(() {
        int newPosition = itemBlank.position;
        int blankNewPosition = item.position;
        item.position = newPosition;
        itemBlank.position = blankNewPosition;
        listItems.sort((a, b) => a.position < b.position ? -1 : 1);
      });
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
              LineBoard(onTap: alterPosition, values: listItems.sublist(0, 4)),
              LineBoard(onTap: alterPosition, values: listItems.sublist(4, 8)),
              LineBoard(onTap: alterPosition, values: listItems.sublist(8, 12)),
              LineBoard(onTap: alterPosition, values: listItems.sublist(12)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            isSequenceValid() ? 'Correto parabéns' : '',
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
