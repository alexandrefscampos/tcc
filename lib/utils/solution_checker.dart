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
    // First, give the UI time to render and position elements
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
