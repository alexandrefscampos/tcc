enum FrogColor {
  green,
  yellow,
  red,
}

class Level {
  final int number;
  final String instructions;
  final List<Position> targetPositions;
  final List<Position> initialPositions;
  final List<String> allowedProperties;
  final String preBuiltCode;
  final String expectedSolution;
  final String? explanation;

  Level({
    required this.number,
    required this.instructions,
    required this.targetPositions,
    required this.initialPositions,
    required this.allowedProperties,
    required this.preBuiltCode,
    this.expectedSolution = '',
    this.explanation,
  });
}

class Position {
  final double x;
  final double y;

  final FrogColor color;

  Position({
    required this.x,
    required this.y,
    required this.color,
  });

  // Helper method to get actual position based on container size
  Position getPixelPosition(double containerWidth, double containerHeight) {
    return Position(
        x: (x * containerWidth) / 100,
        y: (y * containerHeight) / 100,
        color: color);
  }
}
