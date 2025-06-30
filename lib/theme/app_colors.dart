import 'package:flutter/material.dart';

class AppColors {
  // Flutter-themed bird colors
  static const Color birdBlue = Color(0xFF0175C2); // Flutter blue
  static const Color birdDartBlue = Color(0xFF13B9FD); // Dart blue
  static const Color birdLightBlue = Color(0xFF54C5F8); // Light blue

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
  static const Color levelSelectGradientStart =
      Color(0xFF54C5F8); // Flutter light blue
  static const Color levelSelectGradientEnd = Color(0xFF0175C2); // Flutter blue
  static const Color levelButtonBorder = Colors.white;
  static const Color levelButtonText = Colors.white;
  static const Color levelButtonIcon = Colors.white;
  static const Color levelButtonUnlocked = Colors.grey;
  static const Color levelButtonCompleted = Colors.green;
  static const Color levelButtonAvailable = Color(0xFF0175C2); // Flutter blue

  // Colors used in game_area.dart - sky theme for birds
  static const Color skyBackground = Color(0xFFE3F2FD); // Light sky blue

  // Colors used in game_screen.dart
  static const Color gameScreenAppBar = Color(0xFF0175C2); // Flutter blue

  // Colors used in code_parser.dart
  static const Color parserError = Colors.red;

  // Common colors
  static const Color transparent = Colors.transparent;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
}
