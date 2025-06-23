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

  /// Title of the application
  ///
  /// In en, this message translates to:
  /// **'Flutter Flex Frog'**
  String get appTitle;

  /// Title for level selection screen
  ///
  /// In en, this message translates to:
  /// **'Flutter Flex Frog - Levels'**
  String get levelSelectTitle;

  /// Display level number
  ///
  /// In en, this message translates to:
  /// **'Level {number}'**
  String levelNumber(int number);

  /// Success message when completing a level
  ///
  /// In en, this message translates to:
  /// **'Congratulations! 🎉'**
  String get congratulations;

  /// Message when completing a level
  ///
  /// In en, this message translates to:
  /// **'You\'ve completed level {number}!'**
  String levelCompleted(int number);

  /// Button to go to next level
  ///
  /// In en, this message translates to:
  /// **'Next Level'**
  String get nextLevel;

  /// Title when all levels are completed
  ///
  /// In en, this message translates to:
  /// **'🏆 Game Complete! 🏆'**
  String get gameComplete;

  /// Message when completing the entire game
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You\'ve mastered Flutter layouts!'**
  String get gameCompleteMessage;

  /// Button to restart the game
  ///
  /// In en, this message translates to:
  /// **'Play Again'**
  String get playAgain;

  /// Tooltip for reset button
  ///
  /// In en, this message translates to:
  /// **'Reset to original code'**
  String get resetTooltip;

  /// Tooltip for format code button
  ///
  /// In en, this message translates to:
  /// **'Format code'**
  String get formatTooltip;

  /// Hint text for code input field
  ///
  /// In en, this message translates to:
  /// **'Enter your Flutter layout code here...'**
  String get codeHint;

  /// Message while checking solution
  ///
  /// In en, this message translates to:
  /// **'Checking solution...'**
  String get checkingSolution;

  /// Error message when code formatting fails
  ///
  /// In en, this message translates to:
  /// **'Code formatting failed - please check your syntax'**
  String get codeFormattingFailed;

  /// Instructions for level 1
  ///
  /// In en, this message translates to:
  /// **'Center the frogs vertically using Column and mainAxisAlignment.'**
  String get level1Instructions;

  /// Explanation for level 1
  ///
  /// In en, this message translates to:
  /// **'Column widgets arrange their children vertically. mainAxisAlignment controls the vertical positioning.'**
  String get level1Explanation;

  /// Instructions for level 2
  ///
  /// In en, this message translates to:
  /// **'Center the frogs horizontally using Row and mainAxisAlignment.'**
  String get level2Instructions;

  /// Explanation for level 2
  ///
  /// In en, this message translates to:
  /// **'Row widgets arrange their children horizontally. mainAxisAlignment controls the horizontal positioning.'**
  String get level2Explanation;

  /// Instructions for level 3
  ///
  /// In en, this message translates to:
  /// **'Distribute the frogs evenly using Row and mainAxisAlignment.'**
  String get level3Instructions;

  /// Explanation for level 3
  ///
  /// In en, this message translates to:
  /// **'Use spaceEvenly to distribute widgets with equal spacing around them.'**
  String get level3Explanation;

  /// Instructions for level 4
  ///
  /// In en, this message translates to:
  /// **'Arrange the frogs horizontally with equal spacing using Row and mainAxisAlignment.'**
  String get level4Instructions;

  /// Explanation for level 4
  ///
  /// In en, this message translates to:
  /// **'Row widgets arrange their children horizontally. Use spaceBetween to distribute them with equal spacing.'**
  String get level4Explanation;

  /// Instructions for level 5
  ///
  /// In en, this message translates to:
  /// **'Position the frogs at the bottom using Column and mainAxisAlignment.'**
  String get level5Instructions;

  /// Explanation for level 5
  ///
  /// In en, this message translates to:
  /// **'Use mainAxisAlignment: MainAxisAlignment.end to position items at the bottom of a Column.'**
  String get level5Explanation;

  /// Instructions for level 6
  ///
  /// In en, this message translates to:
  /// **'Center the frogs both horizontally and vertically using nested Column and Row.'**
  String get level6Instructions;

  /// Explanation for level 6
  ///
  /// In en, this message translates to:
  /// **'You can nest Row inside Column to control both horizontal and vertical alignment.'**
  String get level6Explanation;

  /// Instructions for level 7
  ///
  /// In en, this message translates to:
  /// **'Position the frogs at the bottom with equal spacing using nested widgets.'**
  String get level7Instructions;

  /// Explanation for level 7
  ///
  /// In en, this message translates to:
  /// **'Combine Column and Row with different alignment properties to achieve complex layouts.'**
  String get level7Explanation;

  /// Instructions for level 8
  ///
  /// In en, this message translates to:
  /// **'Arrange the frogs vertically using Column.'**
  String get level8Instructions;

  /// Explanation for level 8
  ///
  /// In en, this message translates to:
  /// **'Column widgets arrange their children vertically from top to bottom.'**
  String get level8Explanation;

  /// Instructions for level 9
  ///
  /// In en, this message translates to:
  /// **'Position the frogs at the bottom using Flex and direction properties.'**
  String get level9Instructions;

  /// Explanation for level 9
  ///
  /// In en, this message translates to:
  /// **'Flex widgets can be configured to work like Row or Column using the direction property.'**
  String get level9Explanation;

  /// Error when no valid widget format is found
  ///
  /// In en, this message translates to:
  /// **'Invalid syntax: Please use a valid Flutter widget format like \"row(...)\" or \"column(...)\" or \"flex(...)\"'**
  String get syntaxErrorInvalidWidget;

  /// Error when unknown widget is used
  ///
  /// In en, this message translates to:
  /// **'Invalid widget: \"{widgetName}\" is not a valid Flutter widget. Use \"row\" or \"column\" or \"flex\".'**
  String syntaxErrorUnknownWidget(String widgetName);

  /// Error when parentheses don't match
  ///
  /// In en, this message translates to:
  /// **'Syntax error: Mismatched parentheses in your code.'**
  String get syntaxErrorMismatchedParentheses;

  /// Error when square brackets are missing for children
  ///
  /// In en, this message translates to:
  /// **'Syntax error: Children must be enclosed in square brackets [...].'**
  String get syntaxErrorMissingBrackets;

  /// Error when comma is missing after mainAxisAlignment
  ///
  /// In en, this message translates to:
  /// **'Missing comma after mainAxisAlignment. Example: \"mainAxisAlignment: start,\"'**
  String get syntaxErrorMissingCommaAfterMainAxis;

  /// Error when comma is missing after crossAxisAlignment
  ///
  /// In en, this message translates to:
  /// **'Missing comma after crossAxisAlignment. Example: \"crossAxisAlignment: start,\"'**
  String get syntaxErrorMissingCommaAfterCrossAxis;

  /// Error when comma is missing after direction
  ///
  /// In en, this message translates to:
  /// **'Missing comma after direction. Example: \"direction: horizontal,\"'**
  String get syntaxErrorMissingCommaAfterDirection;

  /// Error when comma is missing between properties
  ///
  /// In en, this message translates to:
  /// **'Missing comma between properties. Each property should end with a comma.'**
  String get syntaxErrorMissingCommaBetweenProperties;

  /// Error when comma is missing after children array
  ///
  /// In en, this message translates to:
  /// **'Missing comma after children array. Example: \"children: [frog()],\"'**
  String get syntaxErrorMissingCommaAfterChildren;

  /// Error when colon is missing after property name
  ///
  /// In en, this message translates to:
  /// **'Missing colon after property name. Example: \"direction: horizontal\"'**
  String get syntaxErrorMissingColon;

  /// Error when invalid alignment value is used
  ///
  /// In en, this message translates to:
  /// **'Invalid alignment value \"{value}\". Use: start, end, center, spaceBetween, spaceAround, or spaceEvenly.'**
  String syntaxErrorInvalidAlignment(String value);

  /// Error when invalid direction value is used
  ///
  /// In en, this message translates to:
  /// **'Invalid direction value \"{value}\". Use: horizontal or vertical.'**
  String syntaxErrorInvalidDirection(String value);

  /// Error when parentheses are missing after frog
  ///
  /// In en, this message translates to:
  /// **'Missing parentheses after frog. Use \"frog()\" instead of \"frog\".'**
  String get syntaxErrorMissingParentheses;

  /// Error when wrong number of frogs
  ///
  /// In en, this message translates to:
  /// **'Incorrect number of frogs. Expected {expected} frogs, but found {found}.'**
  String solutionIncorrectFrogCount(int expected, int found);

  /// Error when frog and lilypad counts don't match
  ///
  /// In en, this message translates to:
  /// **'Number of frogs ({frogCount}) does not match number of lilypads ({lilypadCount}).'**
  String solutionMismatchedCount(int frogCount, int lilypadCount);

  /// Success message when level is completed
  ///
  /// In en, this message translates to:
  /// **'Great job! You\'ve completed this level!'**
  String get solutionSuccess;

  /// Error when frogs are not correctly placed
  ///
  /// In en, this message translates to:
  /// **'Not quite right. Make sure each frog is on its matching colored lilypad.'**
  String get solutionIncorrectPlacement;

  /// General error message when code has issues
  ///
  /// In en, this message translates to:
  /// **'There was an error in your code: {error}'**
  String solutionCodeError(String error);
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
