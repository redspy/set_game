import 'package:flutter/material.dart';
import 'views/game_screen.dart';

void main() {
  runApp(const SetGameApp());
}

class SetGameApp extends StatelessWidget {
  const SetGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Set Game',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const GameScreen(),
    );
  }
}
