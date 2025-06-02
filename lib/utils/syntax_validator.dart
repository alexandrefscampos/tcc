import 'package:tcc2/models/check_result.dart';

class SyntaxValidator {
  static SyntaxValidationResult validateCodeSyntax(String code) {
    // Remove extra whitespace and normalize the code
    code = code.trim().toLowerCase().replaceAll('\n', ' ');

    // Check if the code contains valid Flutter widgets
    final widgetMatch = RegExp(r'(\w+)\s*\(').firstMatch(code);
    if (widgetMatch == null) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage:
            'Invalid syntax: Please use a valid Flutter widget format like "row(...)" or "column(...)"',
      );
    }

    final widgetName = widgetMatch.group(1)!;

    // Check if it's a valid widget name
    if (!['row', 'column'].contains(widgetName)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage:
            'Invalid widget: "$widgetName" is not a valid Flutter widget. Use "row" or "column".',
      );
    }

    // Check for common syntax errors before general validation
    final specificErrorCheck = _checkSpecificSyntaxErrors(code);
    if (!specificErrorCheck.isValid) {
      return specificErrorCheck;
    }

    // Check for proper parentheses matching
    if (!_hasMatchingParentheses(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage: 'Syntax error: Mismatched parentheses in your code.',
      );
    }

    // Check for children array if it exists
    if (code.contains('children:')) {
      if (!code.contains('[') || !code.contains(']')) {
        return SyntaxValidationResult(
          isValid: false,
          errorMessage:
              'Syntax error: Children must be enclosed in square brackets [...].',
        );
      }
    }

    return SyntaxValidationResult(isValid: true, errorMessage: '');
  }

  static SyntaxValidationResult _checkSpecificSyntaxErrors(String code) {
    // Check for missing comma after mainAxisAlignment
    if (RegExp(r'mainaxisalignment:\s*\w+\s+[a-z]').hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage:
            'Missing comma after mainAxisAlignment. Example: "mainAxisAlignment: start,"',
      );
    }

    // Check for missing comma after crossAxisAlignment
    if (RegExp(r'crossaxisalignment:\s*\w+\s+[a-z]').hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage:
            'Missing comma after crossAxisAlignment. Example: "crossAxisAlignment: start,"',
      );
    }

    // Check for missing comma between properties
    if (RegExp(r':\s*\w+\s+\w+\s*:').hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage:
            'Missing comma between properties. Each property should end with a comma.',
      );
    }

    // Check for missing comma after children array
    if (RegExp(r'\]\s*\)\s*[^,\s]').hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage:
            'Missing comma after children array. Example: "children: [frog()],"',
      );
    }

    // Check for missing colon after property names
    if (RegExp(r'(mainaxisalignment|crossaxisalignment|children)\s+\w')
        .hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage:
            'Missing colon after property name. Example: "mainAxisAlignment: start"',
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
          errorMessage:
              'Invalid alignment value "$value". Use: start, end, center, spaceBetween, spaceAround, or spaceEvenly.',
        );
      }
    }

    // Check for missing parentheses in function calls
    if (RegExp(r'frog\s*(?!\(\))').hasMatch(code)) {
      return SyntaxValidationResult(
        isValid: false,
        errorMessage:
            'Missing parentheses after frog. Use "frog()" instead of "frog".',
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
