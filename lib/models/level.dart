import 'package:flutter/material.dart';

enum FrogColor {
  green,
  yellow,
  red,
}

class Level {
  final int number;
  final String instructions;
  final List<Position> initialPositions;
  final String preBuiltCode;
  final String expectedSolution;
  final String? explanation;

  final Widget? frogWidget;
  final Widget? lilypadWidget;

  Level({
    required this.number,
    required this.instructions,
    required this.initialPositions,
    required this.preBuiltCode,
    this.expectedSolution = '',
    this.explanation,
    this.frogWidget,
    this.lilypadWidget,
  });
}

class Position {
  final double x;
  final double y;

  final FrogColor color;

  Position({
    required this.x,
    required this.y,
    required this.color,
  });

  // Helper method to get actual position based on container size
  Position getPixelPosition(double containerWidth, double containerHeight) {
    return Position(
        x: (x * containerWidth) / 100,
        y: (y * containerHeight) / 100,
        color: color);
  }
}
