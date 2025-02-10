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
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height,
      color: Colors.lightBlue[100], // Water background
      child: Stack(
        children: [
          if (level.lilypadWidget != null) ...[
            level.lilypadWidget!,
          ],

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
