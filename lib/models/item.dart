Map<int, List<int>> positions = {
  0: [1, 4],
  1: [0, 2, 5],
  2: [1, 3, 6],
  3: [2, 7],
  4: [0, 5, 8],
  5: [1, 4, 9, 6],
  6: [2, 5, 10, 7],
  7: [6, 3, 11],
  8: [4, 12, 9],
  9: [8, 5, 13, 10],
  10: [9, 6, 14, 11],
  11: [10, 7, 15],
  12: [8, 13],
  13: [12, 9, 14],
  14: [13, 10, 15],
  15: [14, 11],
};

class Item {
  String id;
  int position;
  bool isBlank;

  Item(this.id, this.position, [this.isBlank = false]);

  static String getLetter(int index) {
    if (index < 4) {
      return 'A';
    } else if (index < 8) {
      return 'B';
    } else if (index < 12) {
      return 'C';
    } else {
      return 'D';
    }
  }

  //
  bool isSwapPosition(int inPosition) {
    // Este e o item em branco ? Se nao é nem avanca
    if (!isBlank) return false;
    // Baseado na posicao do branco veja se a posicao que solicita troca pode trocar
    return positions[position]!.contains(inPosition);
  }

  @override
  String toString() => isBlank ? '' : id.substring(1);
}
