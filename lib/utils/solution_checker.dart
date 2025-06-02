import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tcc2/models/check_result.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/utils/position_calculator.dart';
import 'package:tcc2/utils/syntax_validator.dart';

class SolutionChecker {
  static Future<CheckResult> checkSolution(
    Level level,
    String userCode,
    List<GlobalKey> frogKeys,
    List<GlobalKey> lilypadKeys,
  ) async {
    // First, validate the syntax of the user's code
    final syntaxValidation = SyntaxValidator.validateCodeSyntax(userCode);
    if (!syntaxValidation.isValid) {
      return CheckResult(
        isCorrect: false,
        message: syntaxValidation.errorMessage,
      );
    }

    // Give the UI time to render and position elements
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      List<Position> frogPositions =
          PositionCalculator.calculateActualPositions(frogKeys);
      List<Position> lilypadPositions =
          PositionCalculator.calculateActualPositions(lilypadKeys);

      // Simply check if each frog is on its matching colored lilypad
      bool allFrogsOnLilypads = PositionCalculator.checkFrogsOnMatchingLilypads(
          frogPositions, lilypadPositions);

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
}
