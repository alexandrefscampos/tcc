// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Flex Frog';

  @override
  String get levelSelectTitle => 'Flutter Flex Frog - Levels';

  @override
  String levelNumber(Object number) {
    return 'Level $number';
  }

  @override
  String get congratulations => 'Congratulations! 🎉';

  @override
  String levelCompleted(Object number) {
    return 'You\'ve completed level $number!';
  }

  @override
  String get nextLevel => 'Next Level';

  @override
  String get gameComplete => '🏆 Game Complete! 🏆';

  @override
  String get gameCompleteMessage =>
      'Congratulations! You\'ve mastered Flutter layouts!';

  @override
  String get playAgain => 'Play Again';

  @override
  String get resetTooltip => 'Reset to original code';

  @override
  String get formatTooltip => 'Format code';

  @override
  String get codeHint => 'Enter your Flutter layout code here...';

  @override
  String get checkingSolution => 'Checking solution...';

  @override
  String get codeFormattingFailed =>
      'Code formatting failed - please check your syntax';

  @override
  String get level1Instructions =>
      'Welcome to Flutter Flex Frog! Your goal is to guide the frog to the lilypad on the right.\n\nUse the mainAxisAlignment property to position items horizontally in a Row. Try changing mainAxisAlignment from start to end.';

  @override
  String get level2Instructions =>
      'Help the frogs reach their lilypads in the center.\n\nThe mainAxisAlignment property accepts these values:\n• start - aligns to the left\n• end - aligns to the right\n• center - centers the items';

  @override
  String get level3Instructions =>
      'Spread the frogs out evenly across the pond.\n\nUse mainAxisAlignment: spaceEvenly to distribute items with equal spacing around them, similar to CSS justify-content: space-evenly.';

  @override
  String get level4Instructions =>
      'Position the frogs with space only between them.\n\nUse mainAxisAlignment: spaceBetween to place equal spacing between items, but not at the edges.';

  @override
  String get level5Instructions =>
      'Move the frogs to the bottom of the pond.\n\nColumn arranges children vertically. Use mainAxisAlignment: end to position items at the bottom of a Column.';

  @override
  String get level6Instructions =>
      'Center the frog both horizontally and vertically.\n\nNest a Row inside a Column to control both axes:\n• Column\'s mainAxisAlignment controls vertical positioning\n• Row\'s mainAxisAlignment controls horizontal positioning';

  @override
  String get level7Instructions =>
      'Position the frogs at the bottom with equal spacing between them.\n\nCombine Column and Row:\n• Use Column with mainAxisAlignment: end for bottom positioning\n• Use Row with mainAxisAlignment: spaceBetween for horizontal spacing';

  @override
  String get level8Instructions =>
      'Stack the frogs vertically.\n\nColumn arranges children from top to bottom, like CSS flex-direction: column. This is the vertical equivalent of Row.';

  @override
  String get level9Instructions =>
      'Use Flex to position the frogs at the bottom.\n\nFlex is the base widget for both Row and Column:\n• direction: horizontal creates a Row\n• direction: vertical creates a Column\n• Use mainAxisAlignment: end to position at the bottom';

  @override
  String get syntaxErrorInvalidWidget =>
      'Invalid syntax: Please use a valid Flutter widget format like \"row(...)\" or \"column(...)\" or \"flex(...)\"';

  @override
  String syntaxErrorUnknownWidget(Object widgetName) {
    return 'Invalid widget: \"$widgetName\" is not a valid Flutter widget. Use \"row\" or \"column\" or \"flex\".';
  }

  @override
  String get syntaxErrorMismatchedParentheses =>
      'Syntax error: Mismatched parentheses in your code.';

  @override
  String get syntaxErrorMissingBrackets =>
      'Syntax error: Children must be enclosed in square brackets [...].';

  @override
  String get syntaxErrorMissingCommaAfterMainAxis =>
      'Missing comma after mainAxisAlignment. Example: \"mainAxisAlignment: start,\"';

  @override
  String get syntaxErrorMissingCommaAfterCrossAxis =>
      'Missing comma after crossAxisAlignment. Example: \"crossAxisAlignment: start,\"';

  @override
  String get syntaxErrorMissingCommaAfterDirection =>
      'Missing comma after direction. Example: \"direction: horizontal,\"';

  @override
  String get syntaxErrorMissingCommaBetweenProperties =>
      'Missing comma between properties. Each property should end with a comma.';

  @override
  String get syntaxErrorMissingCommaAfterChildren =>
      'Missing comma after children array. Example: \"children: [frog()],\"';

  @override
  String get syntaxErrorMissingColon =>
      'Missing colon after property name. Example: \"direction: horizontal\"';

  @override
  String syntaxErrorInvalidAlignment(Object value) {
    return 'Invalid alignment value \"$value\". Use: start, end, center, spaceBetween, spaceAround, or spaceEvenly.';
  }

  @override
  String syntaxErrorInvalidDirection(Object value) {
    return 'Invalid direction value \"$value\". Use: horizontal or vertical.';
  }

  @override
  String get syntaxErrorMissingParentheses =>
      'Missing parentheses after frog. Use \"frog()\" instead of \"frog\".';

  @override
  String solutionIncorrectFrogCount(Object expected, Object found) {
    return 'Incorrect number of frogs. Expected $expected frogs, but found $found.';
  }

  @override
  String solutionMismatchedCount(Object frogCount, Object lilypadCount) {
    return 'Number of frogs ($frogCount) does not match number of lilypads ($lilypadCount).';
  }

  @override
  String get solutionSuccess => 'Great job! You\'ve completed this level!';

  @override
  String get solutionIncorrectPlacement =>
      'Not quite right. Make sure each frog is on its matching colored lilypad.';

  @override
  String solutionCodeError(Object error) {
    return 'There was an error in your code: $error';
  }
}
