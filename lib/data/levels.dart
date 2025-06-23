import 'package:flutter/material.dart';
import 'package:tcc2/enums/frog_color.dart';
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
      ),
      Level(
        number: 2,
        instructions: '', // Will be set dynamically
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
      ),
      Level(
        number: 3,
        instructions: '', // Will be set dynamically
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
      ),
      Level(
        number: 4,
        instructions: '', // Will be set dynamically
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
      ),
      Level(
        number: 5,
        instructions: '', // Will be set dynamically
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
      ),
      Level(
        number: 6,
        instructions: '', // Will be set dynamically
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
      ),
      Level(
        number: 7,
        instructions: '', // Will be set dynamically
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
      ),
      Level(
        number: 8,
        instructions: '', // Will be set dynamically
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
      ),
      Level(
        number: 9,
        instructions: '', // Will be set dynamically
        initialPositions: [
          Position(x: 0, y: 0, color: FrogColor.green),
          Position(x: 0, y: 0, color: FrogColor.yellow),
          Position(x: 0, y: 0, color: FrogColor.red),
        ],
        lilypadWidget: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LilyPad(color: FrogColor.green),
            LilyPad(color: FrogColor.yellow),
            LilyPad(color: FrogColor.red),
          ],
        ),
        preBuiltCode: '''flex(
  direction: horizontal,
  children: [frog(), frog(), frog()]
)''',
      ),
    ];
  }

  static List<Level> getLocalizedLevels(AppLocalizations l10n) {
    final levels = getLevels();

    return levels.map((level) {
      return Level(
        number: level.number,
        instructions: _getInstructionsForLevel(level.number, l10n),
        frogWidget: level.frogWidget,
        lilypadWidget: level.lilypadWidget,
        initialPositions: level.initialPositions,
        preBuiltCode: level.preBuiltCode,
      );
    }).toList();
  }

  static String _getInstructionsForLevel(
      int levelNumber, AppLocalizations l10n) {
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
      case 9:
        return l10n.level9Instructions;
      default:
        return '';
    }
  }
}
