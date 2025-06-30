import 'package:flutter/material.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/theme/app_colors.dart';
import 'package:tcc2/utils/code_parser.dart';
import 'package:tcc2/widgets/game_components.dart';

import '../l10n/app_localizations.dart';

class GameArea extends StatelessWidget {
  final Level level;
  final String userInput;
  static final List<GlobalKey> nestKeys = [];
  static final List<GlobalKey> birdKeys = [];
  const GameArea({
    super.key,
    required this.level,
    required this.userInput,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final l10n = AppLocalizations.of(context)!;

    nestKeys.clear(); // Clear previous keys
    birdKeys.clear(); // Clear previous keys

    final modifiedNestWidget = _addKeysToWidgets(level.nestWidget);
    return Container(
      height: screenSize.height,
      decoration: BoxDecoration(
        color: AppColors.skyBackground, // Sky background for birds
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          if (modifiedNestWidget != null) ...[
            modifiedNestWidget,
          ],

          // User's layout container
          Positioned.fill(
            child: CodeParser.parseCode(
              userInput,
              List.generate(
                level.initialPositions.length,
                (index) {
                  final key = GlobalKey();
                  birdKeys.add(key);
                  return Bird(
                    key: key,
                    color: level.initialPositions[index].color,
                  );
                },
              ),
              l10n,
            ),
          ),
        ],
      ),
    );
  }

  Widget? _addKeysToWidgets(Widget? widget) {
    if (widget == null) return null;

    if (widget is Nest) {
      final key = GlobalKey();
      nestKeys.add(key);
      return Nest(
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
