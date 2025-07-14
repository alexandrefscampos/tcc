import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  // Heading styles
  static const TextStyle heading = TextStyle(
    color: AppColors.codeText,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'monospace',
  );

  static const TextStyle buttonText = TextStyle(
    color: AppColors.levelButtonText,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'monospace',
  );

  // Body text - unified for instructions, feedback, and general text
  static const TextStyle body = TextStyle(
    color: AppColors.codeText,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.4,
    fontFamily: 'monospace',
  );

  // Code text - unified for code input
  static const TextStyle code = TextStyle(
    color: AppColors.codeText,
    fontSize: 14,
    fontFamily: 'monospace',
    height: 1.4,
  );

  // Hint text - for code hints
  static final TextStyle hint = TextStyle(
    color: AppColors.codeHint,
    fontSize: 14,
    fontStyle: FontStyle.italic,
    height: 1.4,
    fontFamily: 'monospace',
  );

  // Error text
  static const TextStyle error = TextStyle(
    color: AppColors.parserError,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.4,
    fontFamily: 'monospace',
  );
}
