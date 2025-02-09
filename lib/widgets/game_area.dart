import 'package:flutter/material.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/utils/code_parser.dart';
import 'package:tcc2/widgets/game_components.dart';

class GameArea extends StatelessWidget {
  final Level level;
  final String userInput;

  const GameArea({
    super.key,
    required this.level,
    required this.userInput,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[100], // Water background
      child: Stack(
        children: [
          // Target positions (lily pads)
          ...level.targetPositions.map((position) => Positioned(
                left: position.x,
                top: position.y,
                child: LilyPad(
                  color: position.color,
                ),
              )),

          // User's layout container
          Positioned.fill(
            child: CodeParser.parseCode(
              userInput,
              List.generate(
                level.initialPositions.length,
                (index) => Frog(
                  color: level.initialPositions[index].color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
