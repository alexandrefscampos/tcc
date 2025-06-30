import 'package:flutter/material.dart';
import 'package:tcc2/enums/bird_color.dart';
import 'package:tcc2/models/position.dart';
import 'package:tcc2/widgets/game_components.dart';

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

        // Get the actual bird color from the widget if possible
        BirdColor color = BirdColor.green;
        if (key.currentWidget is Bird) {
          color = (key.currentWidget as Bird).color;
        } else if (key.currentWidget is Nest) {
          color = (key.currentWidget as Nest).color;
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

  static bool checkBirdsOnMatchingNests(
    List<Position> birdPositions,
    List<Position> nestPositions,
  ) {
    // For each bird, check if it's positioned on a nest of the same color
    for (final birdPosition in birdPositions) {
      bool foundMatch = false;

      for (final nestPosition in nestPositions) {
        // First check if colors match
        if (birdPosition.color == nestPosition.color) {
          // Then check if positions are close enough
          if (isPositionMatch(birdPosition, nestPosition)) {
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

  static bool isPositionMatch(Position actual, Position target) {
    bool match = (actual.x - target.x).abs() <= _positionTolerance &&
        (actual.y - target.y).abs() <= _positionTolerance;

    return match;
  }
}
