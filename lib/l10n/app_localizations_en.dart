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
      'Help the frogs reach their lilypads in the center.\n\nThe mainAxisAlignment property accepts these values:\n• start - aligns to the left\n• end - aligns to the right\n• center - centers the items\n\nLook at where the lilypads are positioned and choose the right alignment!';

  @override
  String get level3Instructions =>
      'Help all three frogs find their lilypads just by using mainAxisAlignment. This time, the lilypads have more space around them.\n\nRemember the possible values for mainAxisAlignment: start, end, center, spaceBetween, spaceAround, spaceEvenly.\n\nThink about how you want to distribute the space around your items.';

  @override
  String get level4Instructions =>
      'Now the lilypads are positioned differently with more space between them. Use mainAxisAlignment to match the frog positions.\n\nHint: Some mainAxisAlignment values create equal spacing between items. Which one puts space between items but not at the edges?';

  @override
  String get level5Instructions =>
      'Move the frogs to the bottom of the pond.\n\nYou\'ll need to switch from Row to Column. Column arranges children vertically instead of horizontally.\n\nThink about which mainAxisAlignment value moves items to the end of their container.';

  @override
  String get level6Instructions =>
      'Center the frog both horizontally and vertically.\n\nTo control both horizontal and vertical positioning, you\'ll need to combine widgets. Consider how Row controls horizontal positioning and Column controls vertical positioning.\n\nCan you nest one inside the other?';

  @override
  String get level7Instructions =>
      'Position the frogs at the bottom with equal spacing between them.\n\nThis challenge combines concepts from previous levels. You\'ll need both vertical and horizontal control.\n\nThink about which widgets and alignment values you\'ve learned so far.';

  @override
  String get level8Instructions =>
      'Stack the frogs vertically to match the lilypads.\n\nColumn arranges children from top to bottom, which is the vertical equivalent of Row.\n\nLook carefully at where each lilypad is positioned.';

  @override
  String get level9Instructions =>
      'Use Flex to position the frogs correctly.\n\nFlex is the base widget for both Row and Column. It has a direction property that determines whether it works horizontally or vertically.\n\nExperiment with direction values and mainAxisAlignment to solve this puzzle.';

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
