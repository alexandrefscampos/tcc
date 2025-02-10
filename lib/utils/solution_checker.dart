import 'package:tcc2/models/level.dart';

class SolutionChecker {
  static const double _positionTolerance = 5; // Tolerance in pixels

  static CheckResult checkSolution(Level level, String userCode) {
    try {
      List<Position> actualPositions =
          _calculateActualPositions(userCode, level);

      bool allPositionsMatch = _comparePositions(
        actualPositions,
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

  static List<Position> _calculateActualPositions(String code, Level level) {
    List<Position> positions = [];
    final properties = _parseProperties(code);

    switch (properties['mainaxisalignment']) {
      case 'center':
        positions = level.targetPositions
            .map((target) => Position(
                  x: target.x,
                  y: target.y,
                  color: target.color,
                ))
            .toList();
        break;
      case 'start':
        // Calculate start positions
        break;
      case 'end':
        // Calculate end positions
        break;
      // Add more cases as needed
    }

    return positions;
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
