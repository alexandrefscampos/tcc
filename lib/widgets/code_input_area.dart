import 'dart:async';

import 'package:dart_style/dart_style.dart';
import 'package:flutter/material.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/utils/syntax_validator.dart';

class CodeInputArea extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onCodeSubmitted;
  final String? feedbackMessage;
  final bool isCorrect;
  final Level currentLevel;

  const CodeInputArea({
    super.key,
    required this.controller,
    required this.onCodeSubmitted,
    required this.currentLevel,
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
    // First check syntax using the existing validation logic
    final syntaxValidation =
        SyntaxValidator.validateCodeSyntax(widget.controller.text);
    if (!syntaxValidation.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(syntaxValidation.errorMessage),
          backgroundColor: Colors.red,
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
        const SnackBar(
          content: Text('Code formatting failed - please check your syntax'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Level ${widget.currentLevel.number}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.refresh, color: Colors.white),
                    onPressed: _resetCode,
                    tooltip: 'Reset to original code',
                  ),
                  IconButton(
                    icon: const Icon(Icons.format_align_left,
                        color: Colors.white),
                    onPressed: _formatCode,
                    tooltip: 'Format code',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.currentLevel.instructions,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),

          const SizedBox(height: 16),

          // Code input
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.isCorrect ? Colors.green : Colors.grey[700]!,
                  width: 2,
                ),
              ),
              child: TextField(
                onChanged: _onTextChanged,
                controller: widget.controller,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'monospace',
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your Flutter layout code here...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
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
                color: widget.isCorrect ? Colors.green[900] : Colors.red[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.feedbackMessage!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
