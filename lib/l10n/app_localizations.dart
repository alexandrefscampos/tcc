import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Flex Frog'**
  String get appTitle;

  /// No description provided for @levelSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Flex Frog - Levels'**
  String get levelSelectTitle;

  /// No description provided for @levelNumber.
  ///
  /// In en, this message translates to:
  /// **'Level {number}'**
  String levelNumber(Object number);

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! 🎉'**
  String get congratulations;

  /// No description provided for @levelCompleted.
  ///
  /// In en, this message translates to:
  /// **'You\'ve completed level {number}!'**
  String levelCompleted(Object number);

  /// No description provided for @nextLevel.
  ///
  /// In en, this message translates to:
  /// **'Next Level'**
  String get nextLevel;

  /// No description provided for @gameComplete.
  ///
  /// In en, this message translates to:
  /// **'🏆 Game Complete! 🏆'**
  String get gameComplete;

  /// No description provided for @gameCompleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You\'ve mastered Flutter layouts!'**
  String get gameCompleteMessage;

  /// No description provided for @playAgain.
  ///
  /// In en, this message translates to:
  /// **'Play Again'**
  String get playAgain;

  /// No description provided for @resetTooltip.
  ///
  /// In en, this message translates to:
  /// **'Reset to original code'**
  String get resetTooltip;

  /// No description provided for @formatTooltip.
  ///
  /// In en, this message translates to:
  /// **'Format code'**
  String get formatTooltip;

  /// No description provided for @codeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your Flutter layout code here...'**
  String get codeHint;

  /// No description provided for @checkingSolution.
  ///
  /// In en, this message translates to:
  /// **'Checking solution...'**
  String get checkingSolution;

  /// No description provided for @codeFormattingFailed.
  ///
  /// In en, this message translates to:
  /// **'Code formatting failed - please check your syntax'**
  String get codeFormattingFailed;

  /// No description provided for @level1Instructions.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Flutter Flex Frog! Your goal is to guide the frog to the lilypad on the right.\n\nUse the mainAxisAlignment property to position items horizontally in a Row. Try changing mainAxisAlignment from start to end.'**
  String get level1Instructions;

  /// No description provided for @level2Instructions.
  ///
  /// In en, this message translates to:
  /// **'Help the frogs reach their lilypads in the center.\n\nThe mainAxisAlignment property accepts these values:\n• start - aligns to the left\n• end - aligns to the right\n• center - centers the items\n\nLook at where the lilypads are positioned and choose the right alignment!'**
  String get level2Instructions;

  /// No description provided for @level3Instructions.
  ///
  /// In en, this message translates to:
  /// **'Help all three frogs find their lilypads just by using mainAxisAlignment. This time, the lilypads have more space around them.\n\nRemember the possible values for mainAxisAlignment: start, end, center, spaceBetween, spaceAround, spaceEvenly.\n\nThink about how you want to distribute the space around your items.'**
  String get level3Instructions;

  /// No description provided for @level4Instructions.
  ///
  /// In en, this message translates to:
  /// **'Now the lilypads are positioned differently with more space between them. Use mainAxisAlignment to match the frog positions.\n\nHint: Some mainAxisAlignment values create equal spacing between items. Which one puts space between items but not at the edges?'**
  String get level4Instructions;

  /// No description provided for @level5Instructions.
  ///
  /// In en, this message translates to:
  /// **'Move the frogs to the bottom of the pond.\n\nYou\'ll need to switch from Row to Column. Column arranges children vertically instead of horizontally.\n\nThink about which mainAxisAlignment value moves items to the end of their container.'**
  String get level5Instructions;

  /// No description provided for @level6Instructions.
  ///
  /// In en, this message translates to:
  /// **'Center the frog both horizontally and vertically.\n\nTo control both horizontal and vertical positioning, you\'ll need to combine widgets. Consider how Row controls horizontal positioning and Column controls vertical positioning.\n\nCan you nest one inside the other?'**
  String get level6Instructions;

  /// No description provided for @level7Instructions.
  ///
  /// In en, this message translates to:
  /// **'Position the frogs at the bottom with equal spacing between them.\n\nThis challenge combines concepts from previous levels. You\'ll need both vertical and horizontal control.\n\nThink about which widgets and alignment values you\'ve learned so far.'**
  String get level7Instructions;

  /// No description provided for @level8Instructions.
  ///
  /// In en, this message translates to:
  /// **'Stack the frogs vertically to match the lilypads.\n\nColumn arranges children from top to bottom, which is the vertical equivalent of Row.\n\nLook carefully at where each lilypad is positioned.'**
  String get level8Instructions;

  /// No description provided for @level9Instructions.
  ///
  /// In en, this message translates to:
  /// **'Use Flex to position the frogs correctly.\n\nFlex is the base widget for both Row and Column. It has a direction property that determines whether it works horizontally or vertically.\n\nExperiment with direction values and mainAxisAlignment to solve this puzzle.'**
  String get level9Instructions;

  /// No description provided for @syntaxErrorInvalidWidget.
  ///
  /// In en, this message translates to:
  /// **'Invalid syntax: Please use a valid Flutter widget format like \"row(...)\" or \"column(...)\" or \"flex(...)\"'**
  String get syntaxErrorInvalidWidget;

  /// No description provided for @syntaxErrorUnknownWidget.
  ///
  /// In en, this message translates to:
  /// **'Invalid widget: \"{widgetName}\" is not a valid Flutter widget. Use \"row\" or \"column\" or \"flex\".'**
  String syntaxErrorUnknownWidget(Object widgetName);

  /// No description provided for @syntaxErrorMismatchedParentheses.
  ///
  /// In en, this message translates to:
  /// **'Syntax error: Mismatched parentheses in your code.'**
  String get syntaxErrorMismatchedParentheses;

  /// No description provided for @syntaxErrorMissingBrackets.
  ///
  /// In en, this message translates to:
  /// **'Syntax error: Children must be enclosed in square brackets [...].'**
  String get syntaxErrorMissingBrackets;

  /// No description provided for @syntaxErrorMissingCommaAfterMainAxis.
  ///
  /// In en, this message translates to:
  /// **'Missing comma after mainAxisAlignment. Example: \"mainAxisAlignment: start,\"'**
  String get syntaxErrorMissingCommaAfterMainAxis;

  /// No description provided for @syntaxErrorMissingCommaAfterCrossAxis.
  ///
  /// In en, this message translates to:
  /// **'Missing comma after crossAxisAlignment. Example: \"crossAxisAlignment: start,\"'**
  String get syntaxErrorMissingCommaAfterCrossAxis;

  /// No description provided for @syntaxErrorMissingCommaAfterDirection.
  ///
  /// In en, this message translates to:
  /// **'Missing comma after direction. Example: \"direction: horizontal,\"'**
  String get syntaxErrorMissingCommaAfterDirection;

  /// No description provided for @syntaxErrorMissingCommaBetweenProperties.
  ///
  /// In en, this message translates to:
  /// **'Missing comma between properties. Each property should end with a comma.'**
  String get syntaxErrorMissingCommaBetweenProperties;

  /// No description provided for @syntaxErrorMissingCommaAfterChildren.
  ///
  /// In en, this message translates to:
  /// **'Missing comma after children array. Example: \"children: [frog()],\"'**
  String get syntaxErrorMissingCommaAfterChildren;

  /// No description provided for @syntaxErrorMissingColon.
  ///
  /// In en, this message translates to:
  /// **'Missing colon after property name. Example: \"direction: horizontal\"'**
  String get syntaxErrorMissingColon;

  /// No description provided for @syntaxErrorInvalidAlignment.
  ///
  /// In en, this message translates to:
  /// **'Invalid alignment value \"{value}\". Use: start, end, center, spaceBetween, spaceAround, or spaceEvenly.'**
  String syntaxErrorInvalidAlignment(Object value);

  /// No description provided for @syntaxErrorInvalidDirection.
  ///
  /// In en, this message translates to:
  /// **'Invalid direction value \"{value}\". Use: horizontal or vertical.'**
  String syntaxErrorInvalidDirection(Object value);

  /// No description provided for @syntaxErrorMissingParentheses.
  ///
  /// In en, this message translates to:
  /// **'Missing parentheses after frog. Use \"frog()\" instead of \"frog\".'**
  String get syntaxErrorMissingParentheses;

  /// No description provided for @solutionIncorrectFrogCount.
  ///
  /// In en, this message translates to:
  /// **'Incorrect number of frogs. Expected {expected} frogs, but found {found}.'**
  String solutionIncorrectFrogCount(Object expected, Object found);

  /// No description provided for @solutionMismatchedCount.
  ///
  /// In en, this message translates to:
  /// **'Number of frogs ({frogCount}) does not match number of lilypads ({lilypadCount}).'**
  String solutionMismatchedCount(Object frogCount, Object lilypadCount);

  /// No description provided for @solutionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Great job! You\'ve completed this level!'**
  String get solutionSuccess;

  /// No description provided for @solutionIncorrectPlacement.
  ///
  /// In en, this message translates to:
  /// **'Not quite right. Make sure each frog is on its matching colored lilypad.'**
  String get solutionIncorrectPlacement;

  /// No description provided for @solutionCodeError.
  ///
  /// In en, this message translates to:
  /// **'There was an error in your code: {error}'**
  String solutionCodeError(Object error);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
