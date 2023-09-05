import 'package:flutter/material.dart';
import 'package:tetris_game/src/screens/board/board_page.dart';

class TetrisGame extends StatelessWidget {
  const TetrisGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BoardPage(),
    );
  }
}
