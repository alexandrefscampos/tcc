import 'package:flutter/material.dart';
import 'package:tcc2/models/position.dart';

class Level {
  final int number;
  final String instructions;
  final List<Position> initialPositions;
  final String preBuiltCode;

  final Widget? birdWidget;
  final Widget? nestWidget;

  Level({
    required this.number,
    required this.instructions,
    required this.initialPositions,
    required this.preBuiltCode,
    this.birdWidget,
    this.nestWidget,
  });
}
