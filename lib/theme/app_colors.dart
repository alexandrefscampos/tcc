import 'package:flutter/material.dart';

class AppColors {
  // Colors actually used in game_components.dart
  static const Color frogGreen = Colors.green;
  static const Color frogYellow = Colors.yellow;
  static const Color frogRed = Colors.red;

  // Colors used in code_input_area.dart
  static final Color codeBackground = Colors.grey[900]!;
  static final Color codeContainer = Colors.grey[800]!;
  static final Color codeInputBackground = Colors.grey[850]!;
  static final Color codeInputBorder = Colors.grey[700]!;
  static const Color codeText = Colors.white;
  static final Color codeHint = Colors.grey[600]!;
  static final Color successBackground = Colors.green[900]!;
  static final Color errorBackground = Colors.red[900]!;
  static const Color snackBarError = Colors.red;
  static const Color successBorder = Colors.green;

  // Colors used in level_select_screen.dart
  static final Color levelSelectGradientStart = Colors.lightBlue[200]!;
  static final Color levelSelectGradientEnd = Colors.lightBlue[800]!;
  static const Color levelButtonBorder = Colors.white;
  static const Color levelButtonText = Colors.white;
  static const Color levelButtonIcon = Colors.white;
  static const Color levelButtonUnlocked = Colors.grey;
  static const Color levelButtonCompleted = Colors.green;
  static const Color levelButtonAvailable = Colors.blue;

  // Colors used in game_area.dart
  static final Color waterBackground = Colors.lightBlue[100]!;

  // Colors used in game_screen.dart
  static const Color gameScreenAppBar = Colors.blue;

  // Colors used in code_parser.dart
  static const Color parserError = Colors.red;

  // Common colors
  static const Color transparent = Colors.transparent;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
}
