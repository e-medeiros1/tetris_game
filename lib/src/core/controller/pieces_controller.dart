// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tetris_game/src/core/consts/constants.dart';
import 'package:tetris_game/src/core/enum/pieces_direction.dart';
import 'package:tetris_game/src/core/enum/pieces_enum.dart';

class PiecesController {
  PiecesEnum type;

  PiecesController({
    required this.type,
  });

  List<int> position = [];

  void initializePiece() {
    switch (type) {
      case PiecesEnum.L:
        position = [-26, -16, -6, -5];
        break;
      case PiecesEnum.J:
        position = [-25, -15, -5, -5];
        break;
      case PiecesEnum.I:
        position = [-4, -5, -6, -7];
        break;
      case PiecesEnum.O:
        position = [-15, -16, -5, -6];
        break;
      case PiecesEnum.S:
        position = [-15, -14, -6, -5];
        break;
      case PiecesEnum.Z:
        position = [-17, -16, -6, -5];
        break;
      case PiecesEnum.T:
        position = [-26, -16, -6, -15];
        break;
      default:
    }
  }

  void movePiece(PiecesDirection direction) {
    switch (direction) {
      case PiecesDirection.down:
        for (int i = 0; i < position.length; i++) {
          position[i] += rowLenght;
        }
        break;
      case PiecesDirection.left:
        for (int i = 0; i < position.length; i++) {
          position[i] -= 1;
        }
        break;
      case PiecesDirection.right:
        for (int i = 0; i < position.length; i++) {
          position[i] += 1;
        }
        break;
      default:
    }
  }
}
