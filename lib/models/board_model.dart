import 'item.dart';

final _blankItem = Item('${Item.getLetter(15)}${15 + 1}', 15, true);
// Sequencia inicial gerada no start da classe
final _initSequence = List.generate(
  15,
  (index) => Item('${Item.getLetter(index)}${index + 1}', index),
).toList();

class BoardModel {
  late List<Item> correctSequence = [..._initSequence, _blankItem];
  late List<Item> listItems = [..._initSequence]..shuffle();

  BoardModel.reorderList() {
    final newItems = <Item>[];
    for (int i = 0; i < listItems.length; i++) {
      listItems[i].position = i;
      newItems.add(listItems[i]);
    }
    // Adicionando o item branco
    newItems.add(_blankItem);
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
