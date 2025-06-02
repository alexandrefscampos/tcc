import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/widgets/game_components.dart';

class SolutionChecker {
  static const double _positionTolerance = 15; // Increased tolerance in pixels

  static Future<CheckResult> checkSolution(
    Level level,
    String userCode,
    List<GlobalKey> frogKeys,
    List<GlobalKey> lilypadKeys,
  ) async {
    // First, validate the syntax of the user's code
    final syntaxValidation = _validateCodeSyntax(userCode);
    if (!syntaxValidation.isValid) {
      return CheckResult(
        isCorrect: false,
        message: syntaxValidation.errorMessage,
      );
    }

    // Give the UI time to render and position elements
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      List<Position> frogPositions = _calculateActualPositions(frogKeys);
      List<Position> lilypadPositions = _calculateActualPositions(lilypadKeys);

      // Simply check if each frog is on its matching colored lilypad
      bool allFrogsOnLilypads =
          _checkFrogsOnMatchingLilypads(frogPositions, lilypadPositions);

      if (allFrogsOnLilypads) {
        return CheckResult(
          isCorrect: true,
          message: 'Great job! You\'ve completed this level!',
        );
      } else {
        return CheckResult(
          isCorrect: false,
          message:
              'Not quite right. Make sure each frog is on its matching colored lilypad.',
        );
      }
    } catch (e) {
      return CheckResult(
        isCorrect: false,
        message: 'There was an error in your code: ${e.toString()}',
      );
    }
  }

  static SyntaxValidationResult _validateCodeSyntax(String code) {
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

  static List<Position> _calculateActualPositions(List<GlobalKey> keys) {
    List<Position> positions = [];

    for (final key in keys) {
      if (key.currentContext != null) {
        final RenderBox renderBox =
            key.currentContext!.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);

        // Get the center point of the widget
        final size = renderBox.size;
        final centerX = position.dx + (size.width / 2);
        final centerY = position.dy + (size.height / 2);

        // Get the actual frog color from the widget if possible
        FrogColor color = FrogColor.green;
        if (key.currentWidget is Frog) {
          color = (key.currentWidget as Frog).color;
        } else if (key.currentWidget is LilyPad) {
          color = (key.currentWidget as LilyPad).color;
        } else {}

        positions.add(Position(
          x: centerX,
          y: centerY,
          color: color,
        ));
      } else {}
    }

    return positions;
  }

  static bool _checkFrogsOnMatchingLilypads(
    List<Position> frogPositions,
    List<Position> lilypadPositions,
  ) {
    // For each frog, check if it's positioned on a lilypad of the same color
    for (final frogPosition in frogPositions) {
      bool foundMatch = false;

      for (final lilypadPosition in lilypadPositions) {
        // First check if colors match
        if (frogPosition.color == lilypadPosition.color) {
          // Then check if positions are close enough
          if (_isPositionMatch(frogPosition, lilypadPosition)) {
            foundMatch = true;
            break;
          }
        }
      }

      if (!foundMatch) {
        return false;
      }
    }

    return true;
  }

  static bool _isPositionMatch(Position actual, Position target) {
    bool match = (actual.x - target.x).abs() <= _positionTolerance &&
        (actual.y - target.y).abs() <= _positionTolerance;

    return match;
  }
}

class CheckResult {
  final bool isCorrect;
  final String message;

  CheckResult({
    required this.isCorrect,
    required this.message,
  });
}

class SyntaxValidationResult {
  final bool isValid;
  final String errorMessage;

  SyntaxValidationResult({
    required this.isValid,
    required this.errorMessage,
  });
}
