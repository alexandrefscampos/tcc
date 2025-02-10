import 'package:flutter/material.dart';
import 'package:tcc2/models/level.dart';

class SolutionChecker {
  static const double _positionTolerance = 5; // Tolerance in pixels

  static CheckResult checkSolution(
    Level level,
    String userCode,
    List<GlobalKey> frogKeys,
    List<GlobalKey> lilypadKeys,
  ) {
    try {
      List<Position> frogPositions = _calculateActualPositions(frogKeys);
      List<Position> lilypadPositions = _calculateActualPositions(lilypadKeys);

      bool frogsOnLilypads =
          _checkFrogsOnLilypads(frogPositions, lilypadPositions);
      if (!frogsOnLilypads) {
        return CheckResult(
          isCorrect: false,
          message: 'Make sure all frogs are on lilypads!',
        );
      }

      bool allPositionsMatch = _comparePositions(
        frogPositions,
        level.targetPositions,
      );

      if (allPositionsMatch) {
        return CheckResult(
          isCorrect: true,
          message: 'Great job! You\'ve completed this level!',
        );
      } else {
        return CheckResult(
          isCorrect: false,
          message: 'Not quite right. Try adjusting your layout.',
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

        positions.add(Position(
          x: centerX,
          y: centerY,
          color: FrogColor.green,
        ));
      }
    }

    return positions;
  }

  static bool _checkFrogsOnLilypads(
    List<Position> frogPositions,
    List<Position> lilypadPositions,
  ) {
    for (int i = 0; i < frogPositions.length; i++) {
      if (!_isPositionMatch(frogPositions[i], lilypadPositions[i])) {
        return false;
      }
    }
    return true;
  }

  static Map<String, String> _parseProperties(String code) {
    final properties = <String, String>{};
    final propertyRegex = RegExp(r'([a-zA-Z]+):\s*([a-zA-Z]+)');
    final matches = propertyRegex.allMatches(code.toLowerCase());

    for (final match in matches) {
      properties[match.group(1)!] = match.group(2)!;
    }

    return properties;
  }

  static bool _comparePositions(
    List<Position> actual,
    List<Position> target,
  ) {
    if (actual.length != target.length) return false;

    for (int i = 0; i < actual.length; i++) {
      if (!_isPositionMatch(actual[i], target[i])) {
        return false;
      }
    }

    return true;
  }

  static bool _isPositionMatch(Position actual, Position target) {
    return (actual.x - target.x).abs() <= _positionTolerance &&
        (actual.y - target.y).abs() <= _positionTolerance;
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
