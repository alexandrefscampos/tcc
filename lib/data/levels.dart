import 'package:tcc2/models/level.dart';

final levels = [
  Level(
    number: 1,
    instructions:
        'Center the green frog vertically using Column and mainAxisAlignment.',
    targetPositions: [Position(x: 50, y: 50, color: FrogColor.green)],
    initialPositions: [Position(x: 0, y: 0, color: FrogColor.green)],
    allowedProperties: ['direction', 'mainAxisAlignment'],
    preBuiltCode: '''column(
  mainAxisAlignment: start,
  children: [frog()]
)''',
    expectedSolution: '''column(
  mainAxisAlignment: center,
  children: [frog()]
)''',
    hint: 'Try changing mainAxisAlignment from start to center',
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
    allowedProperties: ['direction', 'mainAxisAlignment'],
    preBuiltCode: '''row(
  mainAxisAlignment: start,
  children: [frog(), frog(), frog()]
)''',
    expectedSolution: '''row(
  mainAxisAlignment: spaceEvenly,
  children: [frog(), frog(), frog()]
)''',
    hint: 'Use spaceEvenly to distribute the frogs equally',
    explanation:
        'Row widgets arrange their children horizontally. The frogs need to match their colored lilypads.',
  ),
  Level(
    number: 3,
    instructions:
        'Center the frog both horizontally and vertically using nested Row and Column.',
    targetPositions: [Position(x: 50, y: 50)],
    initialPositions: [Position(x: 0, y: 0)],
    allowedProperties: ['direction', 'mainAxisAlignment', 'crossAxisAlignment'],
    preBuiltCode: '''column(
  mainAxisAlignment: start,
  children: [
    row(
      mainAxisAlignment: start,
      children: [frog()]
    )
  ]
)''',
    expectedSolution: '''column(
  mainAxisAlignment: center,
  children: [
    row(
      mainAxisAlignment: center,
      children: [frog()]
    )
  ]
)''',
    hint: 'You\'ll need to center both the Column and Row',
    explanation:
        'Nesting Row and Column widgets allows for both horizontal and vertical positioning.',
  ),
  Level(
    number: 4,
    instructions: 'Place two frogs with equal spacing using spaceBetween.',
    targetPositions: [
      Position(x: 20, y: 50),
      Position(x: 80, y: 50),
    ],
    initialPositions: [
      Position(x: 0, y: 0),
      Position(x: 0, y: 0),
    ],
    allowedProperties: ['direction', 'mainAxisAlignment'],
    preBuiltCode: '''row(
  mainAxisAlignment: start,
  children: [frog(), frog()]
)''',
    expectedSolution: '''row(
  mainAxisAlignment: spaceBetween,
  children: [frog(), frog()]
)''',
    hint: 'spaceBetween puts maximum space between each child',
    explanation:
        'spaceBetween distributes space evenly between children, placing the first and last items at the edges.',
  ),
  Level(
    number: 5,
    instructions: 'Arrange three frogs with equal spacing using spaceAround.',
    targetPositions: [
      Position(x: 20, y: 50),
      Position(x: 50, y: 50),
      Position(x: 80, y: 50),
    ],
    initialPositions: [
      Position(x: 0, y: 0),
      Position(x: 0, y: 0),
      Position(x: 0, y: 0),
    ],
    allowedProperties: ['direction', 'mainAxisAlignment'],
    preBuiltCode: '''row(
  mainAxisAlignment: start,
  children: [frog(), frog(), frog()]
)''',
    expectedSolution: '''row(
  mainAxisAlignment: spaceAround,
  children: [frog(), frog(), frog()]
)''',
    hint: 'spaceAround adds equal space around each child',
    explanation:
        'spaceAround distributes space evenly around each child, including before the first and after the last item.',
  ),
  Level(
    number: 6,
    instructions: 'Create a diagonal line of frogs using crossAxisAlignment.',
    targetPositions: [
      Position(x: 20, y: 20),
      Position(x: 50, y: 50),
      Position(x: 80, y: 80),
    ],
    initialPositions: [
      Position(x: 0, y: 0),
      Position(x: 0, y: 0),
      Position(x: 0, y: 0),
    ],
    allowedProperties: ['direction', 'mainAxisAlignment', 'crossAxisAlignment'],
    preBuiltCode: '''row(
  mainAxisAlignment: spaceEvenly,
  crossAxisAlignment: center,
  children: [frog(), frog(), frog()]
)''',
    expectedSolution: '''row(
  mainAxisAlignment: spaceEvenly,
  crossAxisAlignment: start,
  children: [frog(), frog(), frog()]
)''',
    hint: 'Try adjusting both mainAxisAlignment and crossAxisAlignment',
    explanation:
        'crossAxisAlignment controls positioning along the cross axis (vertical for Row, horizontal for Column).',
  ),
];

class Levels {
  static List<Level> getLevels() {
    return levels;
  }
}
