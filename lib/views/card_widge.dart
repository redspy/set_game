import 'package:flutter/material.dart';
import '../models/set_card.dart';

class CardWidget extends StatelessWidget {
  final SetCard card;
  final bool isSelected;
  final VoidCallback onTap;

  const CardWidget({
    super.key,
    required this.card,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected ? Colors.amber[200] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(
              card.count,
              (index) => Icon(
                _getShapeIcon(card.shape),
                color: _getColor(card.color),
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData _getShapeIcon(int shape) {
    switch (shape) {
      case 0:
        return Icons.circle;
      case 1:
        return Icons.square;
      case 2:
        return Icons.change_history; // triangle
      default:
        return Icons.help;
    }
  }

  Color _getColor(int color) {
    switch (color) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.purple;
      default:
        return Colors.black;
    }
  }
}
