import 'package:flutter/material.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/utils/code_parser.dart';
import 'package:tcc2/widgets/game_components.dart';

class GameArea extends StatelessWidget {
  final Level level;
  final String userInput;
  static final List<GlobalKey> lilypadKeys = [];
  static final List<GlobalKey> frogKeys = [];
  const GameArea({
    super.key,
    required this.level,
    required this.userInput,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    lilypadKeys.clear(); // Clear previous keys
    final modifiedLilypadWidget = _addKeysToWidgets(level.lilypadWidget);
    return Container(
      height: screenSize.height,
      color: Colors.lightBlue[100], // Water background
      child: Stack(
        children: [
          if (modifiedLilypadWidget != null) ...[
            modifiedLilypadWidget,
          ],

          // User's layout container
          Positioned.fill(
            child: CodeParser.parseCode(
              userInput,
              List.generate(
                level.initialPositions.length,
                (index) {
                  final key = GlobalKey();
                  frogKeys.add(key);
                  return Frog(
                    key: key,
                    color: level.initialPositions[index].color,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? _addKeysToWidgets(Widget? widget) {
    if (widget == null) return null;

    if (widget is LilyPad) {
      final key = GlobalKey();
      lilypadKeys.add(key);
      return LilyPad(
        key: key,
        color: widget.color,
      );
    } else if (widget is Row) {
      return Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        children:
            widget.children.map((child) => _addKeysToWidgets(child)!).toList(),
      );
    } else if (widget is Column) {
      return Column(
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        children:
            widget.children.map((child) => _addKeysToWidgets(child)!).toList(),
      );
    }

    return widget;
  }
}
