import 'package:flutter/material.dart';
import 'package:tetris_game/src/core/consts/constants.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({super.key});

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f2f4),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: rowLenght,
            childAspectRatio: 1.3,
            mainAxisSpacing: 2),
        itemCount: rowLenght * columnLenght,
        itemBuilder: (context, index) => Center(
            child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5),
          ),
        )),
      ),
    );
  }
}
