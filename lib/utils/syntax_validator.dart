import 'package:tcc2/models/check_result.dart';

import '../l10n/app_localizations.dart';

class SyntaxValidator {
  static SyntaxValidationResult validateCodeSyntax(
      String code, AppLocalizations l10n) {
    // Remove extra whitespace and normalize the code
    code = code.trim().toLowerCase().replaceAll('\n', ' ');

    // Check if the code contains valid Flutter widgets
    final widgetMatch = RegExp(r'(\w+)\s*\(').firstMatch(code);
    if (widgetMatch == null) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage: l10n.syntaxErrorInvalidWidget,
      );
    }

    final widgetName = widgetMatch.group(1)!;

    // Check if it's a valid widget name
    if (!['row', 'column', 'flex'].contains(widgetName)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage: l10n.syntaxErrorUnknownWidget(widgetName),
      );
    }

    // Check for common syntax errors before general validation
    final specificErrorCheck = _checkSpecificSyntaxErrors(code, l10n);
    if (!specificErrorCheck.isValid) {
      return specificErrorCheck;
    }

    // Check for proper parentheses matching
    if (!_hasMatchingParentheses(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage: l10n.syntaxErrorMismatchedParentheses,
      );
    }

    // Check for children array if it exists
    if (code.contains('children:')) {
      if (!code.contains('[') || !code.contains(']')) {
        return SyntaxValidationResult(
          isValid: false,
          errorMessage: l10n.syntaxErrorMissingBrackets,
        );
      }
    }

    return SyntaxValidationResult(isValid: true, errorMessage: '');
  }

  static SyntaxValidationResult _checkSpecificSyntaxErrors(
      String code, AppLocalizations l10n) {
    // Check for missing comma after mainAxisAlignment
    if (RegExp(r'mainaxisalignment:\s*\w+\s+[a-z]').hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage: l10n.syntaxErrorMissingCommaAfterMainAxis,
      );
    }

    // Check for missing comma after crossAxisAlignment
    if (RegExp(r'crossaxisalignment:\s*\w+\s+[a-z]').hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage: l10n.syntaxErrorMissingCommaAfterCrossAxis,
      );
    }

    // Check for missing comma after direction (for flex widget)
    if (RegExp(r'direction:\s*\w+\s+[a-z]').hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage: l10n.syntaxErrorMissingCommaAfterDirection,
      );
    }

    // Check for missing comma between properties
    if (RegExp(r':\s*\w+\s+\w+\s*:').hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage: l10n.syntaxErrorMissingCommaBetweenProperties,
      );
    }

    // Check for missing comma after children array
    if (RegExp(r'\]\s*\)\s*[^,\s]').hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage: l10n.syntaxErrorMissingCommaAfterChildren,
      );
    }

    // Check for missing colon after property names
    if (RegExp(
            r'(mainaxisalignment|crossaxisalignment|children|direction)\s+\w')
        .hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage: l10n.syntaxErrorMissingColon,
      );
    }

    // Check for common typos in alignment values
    final alignmentMatches =
        RegExp(r'(mainaxisalignment|crossaxisalignment):\s*(\w+)')
            .allMatches(code);
    for (final match in alignmentMatches) {
      final value = match.group(2)!;
      if (![
        'start',
        'end',
        'center',
        'spacebetween',
        'spacearound',
        'spaceevenly'
      ].contains(value)) {
        return SyntaxValidationResult(
          isValid: false,
          errorMessage: l10n.syntaxErrorInvalidAlignment(value),
        );
      }
    }

    // Check for valid direction values in flex widget
    final directionMatches = RegExp(r'direction:\s*(\w+)').allMatches(code);
    for (final match in directionMatches) {
      final value = match.group(1)!;
      if (!['horizontal', 'vertical'].contains(value)) {
        return SyntaxValidationResult(
          isValid: false,
          errorMessage: l10n.syntaxErrorInvalidDirection(value),
        );
      }
    }

    // Check for missing parentheses in function calls
    if (RegExp(r'frog\s*(?!\(\))').hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage: l10n.syntaxErrorMissingParentheses,
      );
    }

    return SyntaxValidationResult(isValid: true, errorMessage: '');
  }

  static bool _hasMatchingParentheses(String code) {
    int parenthesesCount = 0;
    int bracketsCount = 0;

    for (int i = 0; i < code.length; i++) {
      switch (code[i]) {
        case '(':
          parenthesesCount++;
          break;
        case ')':
          parenthesesCount--;
          if (parenthesesCount < 0) return false;
          break;
        case '[':
          bracketsCount++;
          break;
        case ']':
          bracketsCount--;
          if (bracketsCount < 0) return false;
          break;
      }
    }

    return parenthesesCount == 0 && bracketsCount == 0;
  }
}
