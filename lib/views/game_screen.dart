import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import '../models/set_card.dart';
import '../views/card_widge.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameController controller = GameController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SET 게임'),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb),
            tooltip: '힌트',
            onPressed: () {
              setState(() {
                controller.findHint();
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.restart_alt),
            tooltip: '게임 초기화',
            onPressed: () {
              setState(() {
                controller.startNewGame();
              });
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(8),
        children: controller.board.map((card) {
          final selected = controller.selectedCards.contains(card);
          final isHint = controller.hintCards.contains(card);
          return CardWidget(
            card: card,
            isSelected: selected,
            isHint: isHint,
            onTap: () {
              setState(() {
                controller.selectCard(card);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
