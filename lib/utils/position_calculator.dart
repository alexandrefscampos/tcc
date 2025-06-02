import 'package:flutter/material.dart';
import 'package:tcc2/enums/frog_color.dart';
import 'package:tcc2/widgets/game_components.dart';

class Position {
  final double x;
  final double y;
  final FrogColor color;

  Position({
    required this.x,
    required this.y,
    required this.color,
  });
}

class PositionCalculator {
  static const double _positionTolerance = 15; // Increased tolerance in pixels

  static List<Position> calculateActualPositions(List<GlobalKey> keys) {
    List<Position> positions = [];

    for (final key in keys) {
      if (key.currentContext != null) {
        final RenderBox renderBox =
            key.currentContext!.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);

        // Get the center point of the widget
        final size = renderBox.size;
        final centerX = position.dx + (size.width / 2);
        final centerY = position.dy + (size.height / 2);

        // Get the actual frog color from the widget if possible
        FrogColor color = FrogColor.green;
        if (key.currentWidget is Frog) {
          color = (key.currentWidget as Frog).color;
        } else if (key.currentWidget is LilyPad) {
          color = (key.currentWidget as LilyPad).color;
        } else {}

        positions.add(Position(
          x: centerX,
          y: centerY,
          color: color,
        ));
      } else {}
    }

    return positions;
  }

  static bool checkFrogsOnMatchingLilypads(
    List<Position> frogPositions,
    List<Position> lilypadPositions,
  ) {
    // For each frog, check if it's positioned on a lilypad of the same color
    for (final frogPosition in frogPositions) {
      bool foundMatch = false;

      for (final lilypadPosition in lilypadPositions) {
        // First check if colors match
        if (frogPosition.color == lilypadPosition.color) {
          // Then check if positions are close enough
          if (_isPositionMatch(frogPosition, lilypadPosition)) {
            foundMatch = true;
            break;
          }
        }
      }

      if (!foundMatch) {
        return false;
      }
    }

    return true;
  }

  static bool _isPositionMatch(Position actual, Position target) {
    bool match = (actual.x - target.x).abs() <= _positionTolerance &&
        (actual.y - target.y).abs() <= _positionTolerance;

    return match;
  }
}
