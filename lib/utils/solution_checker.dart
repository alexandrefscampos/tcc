import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tcc2/models/check_result.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/models/position.dart';
import 'package:tcc2/utils/position_calculator.dart';
import 'package:tcc2/utils/syntax_validator.dart';

import '../l10n/app_localizations.dart';

class SolutionChecker {
  static Future<CheckResult> checkSolution(
    Level level,
    String userCode,
    List<GlobalKey> birdKeys,
    List<GlobalKey> nestKeys,
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
      List<Position> birdPositions =
          PositionCalculator.calculateActualPositions(birdKeys);
      List<Position> nestPositions =
          PositionCalculator.calculateActualPositions(nestKeys);

      final expectedBirdCount = level.initialPositions.length;
      if (birdPositions.length != expectedBirdCount) {
        return CheckResult(
          isCorrect: false,
          message: l10n.solutionIncorrectFrogCount(
              expectedBirdCount, birdPositions.length),
        );
      }

      if (birdPositions.length != nestPositions.length) {
        return CheckResult(
          isCorrect: false,
          message: l10n.solutionMismatchedCount(
              birdPositions.length, nestPositions.length),
        );
      }

      bool allBirdsCorrectlyPlaced =
          _checkBirdsOnMatchingNestsOneToOne(birdPositions, nestPositions);

      if (allBirdsCorrectlyPlaced) {
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

  static bool _checkBirdsOnMatchingNestsOneToOne(
    List<Position> birdPositions,
    List<Position> nestPositions,
  ) {
    if (birdPositions.length != nestPositions.length) {
      return false;
    }

    Set<int> matchedNestIndices = {};

    for (final birdPosition in birdPositions) {
      bool foundMatch = false;

      for (int i = 0; i < nestPositions.length; i++) {
        final nestPosition = nestPositions[i];

        if (matchedNestIndices.contains(i)) {
          continue;
        }

        if (birdPosition.color == nestPosition.color &&
            PositionCalculator.isPositionMatch(birdPosition, nestPosition)) {
          matchedNestIndices.add(i);
          foundMatch = true;
          break;
        }
      }

      if (!foundMatch) {
        return false;
      }
    }

    return matchedNestIndices.length == birdPositions.length;
  }
}
