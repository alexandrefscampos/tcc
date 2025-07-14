import 'package:flutter/material.dart';
import 'package:tcc2/enums/bird_color.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/models/position.dart';
import 'package:tcc2/widgets/game_components.dart';

import '../l10n/app_localizations.dart';

class Levels {
  static List<Level> getLevels() {
    return [
      Level(
        number: 1,
        instructions: '', // Will be set dynamically
        birdWidget: const Row(children: [Bird(color: BirdColor.green)]),
        nestWidget: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Nest(color: BirdColor.green)],
        ),
        initialPositions: [
          Position(x: 0, y: 0, color: BirdColor.green),
        ],
        preBuiltCode: '''row(
  mainAxisAlignment: start,
  children: [bird()]
)''',
      ),
      Level(
        number: 2,
        instructions: '', // Will be set dynamically
        birdWidget: const Row(children: [
          Bird(color: BirdColor.green),
          Bird(color: BirdColor.yellow)
        ]),
        nestWidget: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.yellow)
          ],
        ),
        initialPositions: [
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.yellow),
        ],
        preBuiltCode: '''row(
    mainAxisAlignment: start,
    children: [bird(), bird()]
  )''',
      ),
      Level(
        number: 3,
        instructions: '', // Will be set dynamically
        birdWidget: const Row(children: [
          Bird(color: BirdColor.green),
          Bird(color: BirdColor.yellow),
          Bird(color: BirdColor.red)
        ]),
        nestWidget: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.yellow),
            Nest(color: BirdColor.red)
          ],
        ),
        initialPositions: [
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.yellow),
          Position(x: 0, y: 0, color: BirdColor.red),
        ],
        preBuiltCode: '''row(
    mainAxisAlignment: start,
    children: [bird(), bird(), bird()]
  )''',
      ),
      Level(
        number: 4,
        instructions: '', // Will be set dynamically
        initialPositions: [
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.yellow),
          Position(x: 0, y: 0, color: BirdColor.red),
        ],
        nestWidget: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.yellow),
            Nest(color: BirdColor.red),
          ],
        ),
        preBuiltCode: '''row(
  mainAxisAlignment: start,
  children: [bird(), bird(), bird()]
)''',
      ),
      Level(
        number: 5,
        instructions: '', // Will be set dynamically
        initialPositions: [
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.yellow),
          Position(x: 0, y: 0, color: BirdColor.red),
        ],
        nestWidget: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Nest(color: BirdColor.green),
                Nest(color: BirdColor.yellow),
                Nest(color: BirdColor.red),
              ],
            ),
          ],
        ),
        preBuiltCode: '''row(
  crossAxisAlignment: start,
  children: [
    bird(),
    bird(),
    bird(),
  ]
)''',
      ),
      Level(
        number: 6,
        instructions: '', // Will be set dynamically
        initialPositions: [
          Position(x: 0, y: 0, color: BirdColor.green),
        ],
        nestWidget: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Nest(color: BirdColor.green),
              ],
            ),
          ],
        ),
        preBuiltCode: '''column(
  mainAxisAlignment: start,
  children: [
    row(
      mainAxisAlignment: start,
      children: [bird()]
    )
  ]
)''',
      ),
      Level(
        number: 7,
        instructions: '', // Will be set dynamically
        initialPositions: [
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.yellow),
          Position(x: 0, y: 0, color: BirdColor.red),
        ],
        nestWidget: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Nest(color: BirdColor.green),
                Nest(color: BirdColor.yellow),
                Nest(color: BirdColor.red),
              ],
            ),
          ],
        ),
        preBuiltCode: '''column(
  children: [
    row(
      children: [bird(), bird(), bird()],
    ),
  ]
)''',
      ),
      Level(
        number: 8,
        instructions: '', // Will be set dynamically
        initialPositions: [
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.yellow),
          Position(x: 0, y: 0, color: BirdColor.red),
        ],
        nestWidget: const Column(
          children: [
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.yellow),
            Nest(color: BirdColor.red),
          ],
        ),
        preBuiltCode: '''row(
  children: [bird(), bird(), bird()]
)''',
      ),
      Level(
        number: 9,
        instructions: '', // Will be set dynamically
        initialPositions: [
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.yellow),
          Position(x: 0, y: 0, color: BirdColor.red),
        ],
        nestWidget: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.yellow),
            Nest(color: BirdColor.red),
          ],
        ),
        preBuiltCode: '''row(
  children: [bird(), bird(), bird()]
)''',
      ),
      Level(
        number: 10,
        instructions: '', // Will be set dynamically
        initialPositions: [
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.yellow),
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.green),
        ],
        nestWidget: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.green),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Nest(color: BirdColor.yellow),
              ],
            ),
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.green),
          ],
        ),
        preBuiltCode: '''row(
  children: [bird(), bird(), bird(), bird(), bird()]
)''',
      ),
      Level(
        number: 11,
        instructions: '', // Will be set dynamically
        initialPositions: [
          Position(x: 0, y: 0, color: BirdColor.yellow),
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.green),
          Position(x: 0, y: 0, color: BirdColor.red),
        ],
        nestWidget: const Wrap(
          children: [
            Nest(color: BirdColor.yellow),
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.green),
            Nest(color: BirdColor.red),
          ],
        ),
        preBuiltCode: '''row(
  children: [bird(), bird(), bird(), bird(), bird(), bird(), bird()]
)''',
      ),
    ];
  }

  static List<Level> getLocalizedLevels(AppLocalizations l10n) {
    final levels = getLevels();
    return levels.map((level) {
      return Level(
        number: level.number,
        instructions: _getInstructions(level.number, l10n),
        initialPositions: level.initialPositions,
        preBuiltCode: level.preBuiltCode,
        birdWidget: level.birdWidget,
        nestWidget: level.nestWidget,
      );
    }).toList();
  }

  static String _getInstructions(int levelNumber, AppLocalizations l10n) {
    switch (levelNumber) {
      case 1:
        return l10n.level1Instructions;
      case 2:
        return l10n.level2Instructions;
      case 3:
        return l10n.level3Instructions;
      case 4:
        return l10n.level4Instructions;
      case 5:
        return l10n.level5Instructions;
      case 6:
        return l10n.level6Instructions;
      case 7:
        return l10n.level7Instructions;
      case 8:
        return l10n.level8Instructions;
      default:
        return '';
    }
  }
}
