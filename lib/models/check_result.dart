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
