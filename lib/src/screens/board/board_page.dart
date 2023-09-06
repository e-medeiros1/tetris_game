import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris_game/src/core/consts/constants.dart';
import 'package:tetris_game/src/core/controller/pieces_controller.dart';
import 'package:tetris_game/src/core/enum/pieces_direction.dart';
import 'package:tetris_game/src/core/enum/pieces_enum.dart';

import '../../core/widgets/pixel.dart';

List<List<PiecesEnum?>> gameBoard =
    List.generate(columnLenght, (i) => List.generate(rowLenght, (j) => null));

class BoardPage extends StatefulWidget {
  const BoardPage({super.key});

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  PiecesController currentPiece = PiecesController(type: PiecesEnum.I);

  @override
  void initState() {
    startGame();
    super.initState();
  }

  void startGame() {
    currentPiece.initializePiece();

    Duration frameRate = const Duration(milliseconds: 900);
    gameLoop(frameRate);
  }

  void gameLoop(Duration frameRate) {
    Timer.periodic(frameRate, (timer) {
      setState(() {
        currentPiece.movePiece(PiecesDirection.down);
      });
    });
  }

  bool checkCollision(PiecesDirection direction) {
    for (int i = 0; i < currentPiece.position.length; i++) {
      int row = (currentPiece.position[i] / rowLenght).floor();
      int column = currentPiece.position[i] % rowLenght;

      if (direction == PiecesDirection.left) {
        column -= 1;
      } else if (direction == PiecesDirection.right) {
        column += 1;
      } else if (direction == PiecesDirection.down) {
        row += 1;
      }

      if (row >= columnLenght || column < 0 || columnLenght >= rowLenght) {
        return true;
      }
    }
    return false;
  }

  checkLanding() {
    if (checkCollision(PiecesDirection.down)) {
      for (int i = 0; i < currentPiece.position.length; i++) {
        int row = (currentPiece.position[i] / rowLenght).floor();
        int column = currentPiece.position[i] % rowLenght;

        if (row >= 0 && column >= 0) {
          gameBoard[row][column] = currentPiece.type;
        }
      }

      createNewPiece();
    }
  }

  void createNewPiece() {
    Random random = Random();
//Attention to this line(wtf?)
    PiecesEnum randomType =
        PiecesEnum.values[random.nextInt(PiecesEnum.values.length)];
    currentPiece = PiecesController(type: randomType);
    currentPiece.initializePiece();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f2f4),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: rowLenght, childAspectRatio: 1.2),
          itemCount: rowLenght * columnLenght,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (currentPiece.position.contains(index)) {
              return Pixel(
                color: Colors.yellow,
                child: index,
              );
            } else {
              return Pixel(
                color: Colors.grey.shade300,
                child: index,
              );
            }
          }),
    );
  }
}
