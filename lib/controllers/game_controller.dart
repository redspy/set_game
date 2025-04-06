import '../models/set_card.dart';

class GameController {
  List<SetCard> deck = [];
  List<SetCard> board = [];
  List<SetCard> selectedCards = [];
  List<SetCard> hintCards = [];

  GameController() {
    startNewGame();
  }

  void startNewGame() {
    deck = SetCard.generateDeck();
    board = deck.sublist(0, 12);
    deck.removeRange(0, 12);
    selectedCards = [];
    hintCards = [];
  }

  void selectCard(SetCard card) {
    if (selectedCards.contains(card)) {
      selectedCards.remove(card);
    } else {
      selectedCards.add(card);
    }

    hintCards.clear(); // 힌트 지우기

    if (selectedCards.length == 3) {
      if (isSet(selectedCards[0], selectedCards[1], selectedCards[2])) {
        _replaceOrRemoveCards();
      }
      selectedCards.clear();
    }
  }

  bool isSet(SetCard a, SetCard b, SetCard c) {
    bool attrCheck(int Function(SetCard) attr) {
      final values = {attr(a), attr(b), attr(c)};
      return values.length == 1 || values.length == 3;
    }

    return attrCheck((e) => e.shape) &&
        attrCheck((e) => e.color) &&
        attrCheck((e) => e.count) &&
        attrCheck((e) => e.shading);
  }

  void _replaceOrRemoveCards() {
    for (var card in selectedCards) {
      int index = board.indexOf(card);
      if (deck.isNotEmpty) {
        board[index] = deck.removeAt(0);
      } else {
        board.removeAt(index);
      }
    }
  }

  void findHint() {
    hintCards.clear();
    for (int i = 0; i < board.length; i++) {
      for (int j = i + 1; j < board.length; j++) {
        for (int k = j + 1; k < board.length; k++) {
          final a = board[i], b = board[j], c = board[k];
          if (isSet(a, b, c)) {
            hintCards = [a, b, c];
            return;
          }
        }
      }
    }
  }
}
