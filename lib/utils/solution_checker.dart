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
    final syntaxValidation = SyntaxValidator.validateCodeSyntax(userCode);
    if (!syntaxValidation.isValid) {
      return CheckResult(
        isCorrect: false,
        message: syntaxValidation.errorMessage,
      );
    }

    await Future.delayed(const Duration(milliseconds: 500));

    try {
      List<Position> frogPositions =
          PositionCalculator.calculateActualPositions(frogKeys);
      List<Position> lilypadPositions =
          PositionCalculator.calculateActualPositions(lilypadKeys);

      final expectedFrogCount = level.initialPositions.length;
      if (frogPositions.length != expectedFrogCount) {
        return CheckResult(
          isCorrect: false,
          message:
              'Incorrect number of frogs. Expected $expectedFrogCount frogs, but found ${frogPositions.length}.',
        );
      }

      if (frogPositions.length != lilypadPositions.length) {
        return CheckResult(
          isCorrect: false,
          message:
              'Number of frogs (${frogPositions.length}) does not match number of lilypads (${lilypadPositions.length}).',
        );
      }

      bool allFrogsCorrectlyPlaced = _checkFrogsOnMatchingLilypadsOneToOne(
          frogPositions, lilypadPositions);

      if (allFrogsCorrectlyPlaced) {
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

  static bool _checkFrogsOnMatchingLilypadsOneToOne(
    List<Position> frogPositions,
    List<Position> lilypadPositions,
  ) {
    if (frogPositions.length != lilypadPositions.length) {
      return false;
    }

    Set<int> matchedLilypadIndices = {};

    for (final frogPosition in frogPositions) {
      bool foundMatch = false;

      for (int i = 0; i < lilypadPositions.length; i++) {
        final lilypadPosition = lilypadPositions[i];

        if (matchedLilypadIndices.contains(i)) {
          continue;
        }

        if (frogPosition.color == lilypadPosition.color &&
            PositionCalculator.isPositionMatch(frogPosition, lilypadPosition)) {
          matchedLilypadIndices.add(i);
          foundMatch = true;
          break;
        }
      }

      if (!foundMatch) {
        return false;
      }
    }

    return matchedLilypadIndices.length == frogPositions.length;
  }
}
