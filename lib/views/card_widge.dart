import 'package:flutter/material.dart';
import '../models/set_card.dart';

class CardWidget extends StatelessWidget {
  final SetCard card;
  final bool isSelected;
  final bool isHint;
  final VoidCallback onTap;

  const CardWidget({
    super.key,
    required this.card,
    required this.isSelected,
    required this.isHint,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected
            ? Colors.amber[300]
            : isHint
                ? Colors.lightBlue[100]
                : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isHint ? Colors.blue : Colors.grey,
            width: isHint ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              card.count,
              (index) => Icon(
                _getShapeIcon(card.shape),
                color: _getColor(card.color),
                size: 28,
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
        return Icons.change_history;
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
