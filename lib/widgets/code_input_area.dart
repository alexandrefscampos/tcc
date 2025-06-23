import 'dart:async';

import 'package:dart_style/dart_style.dart';
import 'package:flutter/material.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/theme/app_colors.dart';
import 'package:tcc2/theme/app_text_styles.dart';
import 'package:tcc2/utils/syntax_validator.dart';

import '../l10n/app_localizations.dart';

class CodeInputArea extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onCodeSubmitted;
  final Function(String)? onTextChanged;
  final String? feedbackMessage;
  final bool isCorrect;
  final Level currentLevel;

  const CodeInputArea({
    super.key,
    required this.controller,
    required this.onCodeSubmitted,
    required this.currentLevel,
    this.onTextChanged,
    this.feedbackMessage,
    this.isCorrect = false,
  });

  @override
  State<CodeInputArea> createState() => _CodeInputAreaState();
}

class _CodeInputAreaState extends State<CodeInputArea> {
  final _formatter = DartFormatter();
  Timer? _debounceTimer;

  void _onTextChanged(String value) {
    // Notify parent widget about text changes for undo/redo
    widget.onTextChanged?.call(value);

    // Cancel the previous timer
    _debounceTimer?.cancel();

    // Set a new timer
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      widget.onCodeSubmitted(value);
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _resetCode() {
    widget.controller.text = widget.currentLevel.preBuiltCode;
    _debounceTimer?.cancel();
    widget.onCodeSubmitted(widget.currentLevel.preBuiltCode);
  }

  void _formatCode() {
    final l10n = AppLocalizations.of(context)!;

    // First check syntax using the existing validation logic
    final syntaxValidation =
        SyntaxValidator.validateCodeSyntax(widget.controller.text, l10n);
    if (!syntaxValidation.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(syntaxValidation.errorMessage),
          backgroundColor: AppColors.snackBarError,
          duration: const Duration(seconds: 4),
        ),
      );
      return;
    }

    // If syntax is valid, try to format
    try {
      final formattedCode =
          _formatter.formatSource(SourceCode(widget.controller.text));
      widget.controller.value = TextEditingValue(
        text: formattedCode.text,
        selection: TextSelection.collapsed(offset: formattedCode.text.length),
      );
      _debounceTimer?.cancel();
      widget.onCodeSubmitted(formattedCode.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.codeFormattingFailed),
          backgroundColor: AppColors.snackBarError,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      color: AppColors.codeBackground,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.levelNumber(widget.currentLevel.number),
                style: AppTextStyles.heading,
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.refresh, color: AppColors.codeText),
                    onPressed: _resetCode,
                    tooltip: l10n.resetTooltip,
                  ),
                  IconButton(
                    icon: const Icon(Icons.format_align_left,
                        color: AppColors.codeText),
                    onPressed: _formatCode,
                    tooltip: l10n.formatTooltip,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.codeContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.currentLevel.instructions,
              style: AppTextStyles.body,
            ),
          ),
          const SizedBox(height: 16),

          const SizedBox(height: 16),

          // Code input
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.codeInputBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.isCorrect
                      ? AppColors.successBorder
                      : AppColors.codeInputBorder,
                  width: 2,
                ),
              ),
              child: TextField(
                onChanged: _onTextChanged,
                controller: widget.controller,
                style: AppTextStyles.code,
                decoration: InputDecoration(
                  hintText: l10n.codeHint,
                  hintStyle: AppTextStyles.hint,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
                maxLines: null,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Feedback message
          if (widget.feedbackMessage != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.isCorrect
                    ? AppColors.successBackground
                    : AppColors.errorBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.feedbackMessage!,
                style: AppTextStyles.body,
              ),
            ),
        ],
      ),
    );
  }
}
