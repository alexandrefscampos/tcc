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
  String levelNumber(int number) {
    return 'Level $number';
  }

  @override
  String get congratulations => 'Congratulations! 🎉';

  @override
  String levelCompleted(int number) {
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
      'Center the frogs vertically using Column and mainAxisAlignment.';

  @override
  String get level1Explanation =>
      'Column widgets arrange their children vertically. mainAxisAlignment controls the vertical positioning.';

  @override
  String get level2Instructions =>
      'Center the frogs horizontally using Row and mainAxisAlignment.';

  @override
  String get level2Explanation =>
      'Row widgets arrange their children horizontally. mainAxisAlignment controls the horizontal positioning.';

  @override
  String get level3Instructions =>
      'Distribute the frogs evenly using Row and mainAxisAlignment.';

  @override
  String get level3Explanation =>
      'Use spaceEvenly to distribute widgets with equal spacing around them.';

  @override
  String get level4Instructions =>
      'Arrange the frogs horizontally with equal spacing using Row and mainAxisAlignment.';

  @override
  String get level4Explanation =>
      'Row widgets arrange their children horizontally. Use spaceBetween to distribute them with equal spacing.';

  @override
  String get level5Instructions =>
      'Position the frogs at the bottom using Column and mainAxisAlignment.';

  @override
  String get level5Explanation =>
      'Use mainAxisAlignment: MainAxisAlignment.end to position items at the bottom of a Column.';

  @override
  String get level6Instructions =>
      'Center the frogs both horizontally and vertically using nested Column and Row.';

  @override
  String get level6Explanation =>
      'You can nest Row inside Column to control both horizontal and vertical alignment.';

  @override
  String get level7Instructions =>
      'Position the frogs at the bottom with equal spacing using nested widgets.';

  @override
  String get level7Explanation =>
      'Combine Column and Row with different alignment properties to achieve complex layouts.';

  @override
  String get level8Instructions => 'Arrange the frogs vertically using Column.';

  @override
  String get level8Explanation =>
      'Column widgets arrange their children vertically from top to bottom.';

  @override
  String get level9Instructions =>
      'Position the frogs at the bottom using Flex and direction properties.';

  @override
  String get level9Explanation =>
      'Flex widgets can be configured to work like Row or Column using the direction property.';

  @override
  String get syntaxErrorInvalidWidget =>
      'Invalid syntax: Please use a valid Flutter widget format like \"row(...)\" or \"column(...)\" or \"flex(...)\"';

  @override
  String syntaxErrorUnknownWidget(String widgetName) {
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
  String syntaxErrorInvalidAlignment(String value) {
    return 'Invalid alignment value \"$value\". Use: start, end, center, spaceBetween, spaceAround, or spaceEvenly.';
  }

  @override
  String syntaxErrorInvalidDirection(String value) {
    return 'Invalid direction value \"$value\". Use: horizontal or vertical.';
  }

  @override
  String get syntaxErrorMissingParentheses =>
      'Missing parentheses after frog. Use \"frog()\" instead of \"frog\".';

  @override
  String solutionIncorrectFrogCount(int expected, int found) {
    return 'Incorrect number of frogs. Expected $expected frogs, but found $found.';
  }

  @override
  String solutionMismatchedCount(int frogCount, int lilypadCount) {
    return 'Number of frogs ($frogCount) does not match number of lilypads ($lilypadCount).';
  }

  @override
  String get solutionSuccess => 'Great job! You\'ve completed this level!';

  @override
  String get solutionIncorrectPlacement =>
      'Not quite right. Make sure each frog is on its matching colored lilypad.';

  @override
  String solutionCodeError(String error) {
    return 'There was an error in your code: $error';
  }
}
