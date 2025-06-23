import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tcc2/models/check_result.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/utils/position_calculator.dart';
import 'package:tcc2/utils/syntax_validator.dart';

import '../l10n/app_localizations.dart';

class SolutionChecker {
  static Future<CheckResult> checkSolution(
    Level level,
    String userCode,
    List<GlobalKey> frogKeys,
    List<GlobalKey> lilypadKeys,
    AppLocalizations l10n,
  ) async {
    final syntaxValidation = SyntaxValidator.validateCodeSyntax(userCode, l10n);
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
          message: l10n.solutionIncorrectFrogCount(
              expectedFrogCount, frogPositions.length),
        );
      }

      if (frogPositions.length != lilypadPositions.length) {
        return CheckResult(
          isCorrect: false,
          message: l10n.solutionMismatchedCount(
              frogPositions.length, lilypadPositions.length),
        );
      }

      bool allFrogsCorrectlyPlaced = _checkFrogsOnMatchingLilypadsOneToOne(
          frogPositions, lilypadPositions);

      if (allFrogsCorrectlyPlaced) {
        return CheckResult(
          isCorrect: true,
          message: l10n.solutionSuccess,
        );
      } else {
        return CheckResult(
          isCorrect: false,
          message: l10n.solutionIncorrectPlacement,
        );
      }
    } catch (e) {
      return CheckResult(
        isCorrect: false,
        message: l10n.solutionCodeError(e.toString()),
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
