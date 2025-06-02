import 'package:flutter/material.dart';
import 'package:tcc2/enums/frog_color.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/models/position.dart';
import 'package:tcc2/widgets/game_components.dart';

final levels = [
  Level(
    number: 1,
    instructions:
        'Center the frogs vertically using Column and mainAxisAlignment.',
    frogWidget: const Row(children: [Frog(color: FrogColor.green)]),
    lilypadWidget: const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [LilyPad(color: FrogColor.green)],
    ),
    initialPositions: [
      Position(x: 0, y: 0, color: FrogColor.green),
    ],
    preBuiltCode: '''row(
  mainAxisAlignment: start,
  children: [frog()]
)''',
    explanation:
        'Column widgets arrange their children vertically. mainAxisAlignment controls the vertical positioning.',
  ),
  Level(
    number: 2,
    instructions:
        'Center the frogs horizontally using Row and mainAxisAlignment.',
    frogWidget: const Row(children: [
      Frog(color: FrogColor.green),
      Frog(color: FrogColor.yellow)
    ]),
    lilypadWidget: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LilyPad(color: FrogColor.green),
        LilyPad(color: FrogColor.yellow)
      ],
    ),
    initialPositions: [
      Position(x: 0, y: 0, color: FrogColor.green),
      Position(x: 0, y: 0, color: FrogColor.yellow),
    ],
    preBuiltCode: '''row(
    mainAxisAlignment: start,
    children: [frog(), frog()]
  )''',
    explanation:
        'Column widgets arrange their children vertically. mainAxisAlignment controls the vertical positioning.',
  ),
  Level(
    number: 3,
    instructions:
        'Center the frogs horizontally using Row and mainAxisAlignment.',
    frogWidget: const Row(children: [
      Frog(color: FrogColor.green),
      Frog(color: FrogColor.yellow),
      Frog(color: FrogColor.red)
    ]),
    lilypadWidget: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LilyPad(color: FrogColor.green),
        LilyPad(color: FrogColor.yellow),
        LilyPad(color: FrogColor.red)
      ],
    ),
    initialPositions: [
      Position(x: 0, y: 0, color: FrogColor.green),
      Position(x: 0, y: 0, color: FrogColor.yellow),
      Position(x: 0, y: 0, color: FrogColor.red),
    ],
    preBuiltCode: '''row(
    mainAxisAlignment: start,
    children: [frog(), frog(), frog()]
  )''',
    explanation:
        'Column widgets arrange their children vertically. mainAxisAlignment controls the vertical positioning.',
  ),
  Level(
    number: 4,
    instructions:
        'Arrange the frogs horizontally with equal spacing using Row and mainAxisAlignment.',
    initialPositions: [
      Position(x: 0, y: 0, color: FrogColor.green),
      Position(x: 0, y: 0, color: FrogColor.yellow),
      Position(x: 0, y: 0, color: FrogColor.red),
    ],
    lilypadWidget: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LilyPad(color: FrogColor.green),
        LilyPad(color: FrogColor.yellow),
        LilyPad(color: FrogColor.red),
      ],
    ),
    preBuiltCode: '''row(
  mainAxisAlignment: start,
  children: [frog(), frog(), frog()]
)''',
    explanation:
        'Row widgets arrange their children horizontally. Use spaceEvenly to distribute them with equal spacing.',
  ),
  Level(
    number: 5,
    instructions:
        'Arrange the frogs horizontally with equal spacing using Row and mainAxisAlignment.',
    initialPositions: [
      Position(x: 0, y: 0, color: FrogColor.green),
      Position(x: 0, y: 0, color: FrogColor.yellow),
      Position(x: 0, y: 0, color: FrogColor.red),
    ],
    lilypadWidget: const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            LilyPad(color: FrogColor.green),
            LilyPad(color: FrogColor.yellow),
            LilyPad(color: FrogColor.red),
          ],
        ),
      ],
    ),
    preBuiltCode: '''row(
  crossAxisAlignment: start,
  children: [
    frog(),
    frog(),
    frog(),
  ]
)''',
    explanation:
        'Row widgets arrange their children horizontally. Use spaceEvenly to distribute them with equal spacing.',
  ),
  Level(
    number: 6,
    instructions:
        'Center the frogs both horizontally and vertically using nested Column and Row.',
    initialPositions: [
      Position(x: 0, y: 0, color: FrogColor.green),
    ],
    lilypadWidget: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LilyPad(color: FrogColor.green),
          ],
        ),
      ],
    ),
    preBuiltCode: '''column(
  mainAxisAlignment: start,
  children: [
    row(
      mainAxisAlignment: start,
      children: [frog()]
    )
  ]
)''',
    explanation:
        'You can nest Row inside Column to control both horizontal and vertical alignment.',
  ),
  Level(
    number: 7,
    instructions:
        'Arrange the frogs horizontally with equal spacing using Row and mainAxisAlignment.',
    initialPositions: [
      Position(x: 0, y: 0, color: FrogColor.green),
      Position(x: 0, y: 0, color: FrogColor.yellow),
      Position(x: 0, y: 0, color: FrogColor.red),
    ],
    lilypadWidget: const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LilyPad(color: FrogColor.green),
            LilyPad(color: FrogColor.yellow),
            LilyPad(color: FrogColor.red),
          ],
        ),
      ],
    ),
    preBuiltCode: '''column(
  children: [
    row(
      children: [frog(), frog(), frog()],
    ),
  ]
)''',
    explanation:
        'Row widgets arrange their children horizontally. Use spaceEvenly to distribute them with equal spacing.',
  ),
  Level(
    number: 8,
    instructions:
        'Arrange the frogs horizontally with equal spacing using Row and mainAxisAlignment.',
    initialPositions: [
      Position(x: 0, y: 0, color: FrogColor.green),
      Position(x: 0, y: 0, color: FrogColor.yellow),
      Position(x: 0, y: 0, color: FrogColor.red),
    ],
    lilypadWidget: const Column(
      children: [
        LilyPad(color: FrogColor.green),
        LilyPad(color: FrogColor.yellow),
        LilyPad(color: FrogColor.red),
      ],
    ),
    preBuiltCode: '''row(
  children: [frog(), frog(), frog()]
)''',
    explanation:
        'Row widgets arrange their children horizontally. Use spaceEvenly to distribute them with equal spacing.',
  ),
];

class Levels {
  static List<Level> getLevels() {
    return levels;
  }
}
