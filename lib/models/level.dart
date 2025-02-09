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
  final String? hint;
  final String preBuiltCode; // New field for starter code
  final String expectedSolution; // Optional field for the correct solution
  final String? explanation; // New field to explain the concept

  Level({
    required this.number,
    required this.instructions,
    required this.targetPositions,
    required this.initialPositions,
    required this.allowedProperties,
    required this.preBuiltCode,
    this.expectedSolution = '',
    this.hint,
    this.explanation,
  });
}

class Position {
  final double x; // Now represents percentage (0-100)
  final double y; // Now represents percentage (0-100)
  final bool isPercentage; // Flag to determine if position is percentage-based
  final FrogColor color;

  Position({
    required this.x,
    required this.y,
    this.isPercentage = true, // Default to percentage-based positioning
    this.color = FrogColor.green,
  });

  // Helper method to get actual position based on container size
  Position getPixelPosition(double containerWidth, double containerHeight) {
    if (isPercentage) {
      return Position(
          x: (x * containerWidth) / 100,
          y: (y * containerHeight) / 100,
          isPercentage: false,
          color: color);
    }
    return this;
  }
}
