import 'item.dart';

// Sequencia inicial gerada no start da classe
final _initSequence = List.generate(
  15,
  (index) => Item('${Item.getLetter(index)}${index + 1}', index),
).toList();

class BoardModel {
  final List<Item> correctSequence = [
    ..._initSequence,
    Item('${Item.getLetter(15)}${15 + 1}', 15, true)
  ];
  late List<Item> listItems;

  BoardModel.reorderList() {
    final newItems = <Item>[];
    final newReorderList = [..._initSequence]..shuffle();

    for (int i = 0; i < newReorderList.length; i++) {
      newReorderList[i].position = i;
      newItems.add(newReorderList[i]);
    }
    // Adicionando o item branco
    newItems.add(Item('${Item.getLetter(15)}${15 + 1}', 15, true));
    listItems = newItems;
  }

  bool alterPosition(Item item) {
    bool positionModified = false;

    final itemBlank = listItems.firstWhere((Item item) => item.isBlank);

    if (itemBlank.isSwapPosition(item.position)) {
      // Vamos criar uma nova lista e reposicionar os itens
      int newPosition = itemBlank.position;
      int blankNewPosition = item.position;
      item.position = newPosition;
      itemBlank.position = blankNewPosition;
      listItems.sort((a, b) => a.position < b.position ? -1 : 1);
      positionModified = true;
    }
    return positionModified;
  }

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
}
