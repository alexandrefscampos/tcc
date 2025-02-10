import 'package:flutter/material.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/widgets/game_components.dart';

final levels = [
  Level(
    number: 1,
    instructions:
        'Center the green frog vertically using Column and mainAxisAlignment.',
    targetPositions: [Position(x: 0, y: 90, color: FrogColor.green)],
    frogWidget: const Row(children: [Frog(color: FrogColor.green)]),
    lilypadWidget: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LilyPad(color: FrogColor.green),
        LilyPad(color: FrogColor.yellow),
        LilyPad(color: FrogColor.red),
      ],
    ),
    initialPositions: [
      Position(x: 0, y: 0, color: FrogColor.green),
      Position(x: 0, y: 0, color: FrogColor.yellow),
      Position(x: 0, y: 0, color: FrogColor.red),
    ],
    preBuiltCode: '''column(
  mainAxisAlignment: start,
  children: [frog(), frog(), frog()]
)''',
    expectedSolution: '''column(
  mainAxisAlignment: center,
  children: [frog(), frog(), frog()]
)''',
    explanation:
        'Column widgets arrange their children vertically. mainAxisAlignment controls the vertical positioning.',
  ),
  Level(
    number: 2,
    instructions: 'Arrange the colored frogs in order: green, yellow, red.',
    targetPositions: [
      Position(x: 20, y: 50, color: FrogColor.green),
      Position(x: 50, y: 50, color: FrogColor.yellow),
      Position(x: 80, y: 50, color: FrogColor.red),
    ],
    initialPositions: [
      Position(x: 0, y: 0, color: FrogColor.green),
      Position(x: 0, y: 0, color: FrogColor.yellow),
      Position(x: 0, y: 0, color: FrogColor.red),
    ],
    preBuiltCode: '''row(
  mainAxisAlignment: start,
  children: [frog(), frog(), frog()]
)''',
    expectedSolution: '''row(
  mainAxisAlignment: spaceEvenly,
  children: [frog(), frog(), frog()]
)''',
    explanation:
        'Row widgets arrange their children horizontally. The frogs need to match their colored lilypads.',
  ),
];

class Levels {
  static List<Level> getLevels() {
    return levels;
  }
}
