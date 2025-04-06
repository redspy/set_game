class SetCard {
  final int shape;
  final int color;
  final int count;
  final int shading;

  const SetCard({
    required this.shape,
    required this.color,
    required this.count,
    required this.shading,
  });

  static List<SetCard> generateDeck() {
    List<SetCard> deck = [];
    for (int s = 0; s < 3; s++) {
      for (int c = 0; c < 3; c++) {
        for (int n = 1; n <= 3; n++) {
          for (int h = 0; h < 3; h++) {
            deck.add(SetCard(shape: s, color: c, count: n, shading: h));
          }
        }
      }
    }
    deck.shuffle();
    return deck;
  }
}
