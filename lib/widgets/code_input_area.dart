import 'package:dart_style/dart_style.dart';
import 'package:flutter/material.dart';
import 'package:tcc2/models/level.dart';

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

  void _formatCode() {
    try {
      final formattedCode =
          _formatter.formatSource(SourceCode(widget.controller.text));
      widget.controller.value = TextEditingValue(
        text: formattedCode.text,
        selection: TextSelection.collapsed(offset: formattedCode.text.length),
      );
      widget.onCodeSubmitted(formattedCode.text);
    } catch (e) {
      // Show error snackbar if code cannot be formatted
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not format code: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize text controller with pre-built code
    widget.controller.text = widget.currentLevel.preBuiltCode;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Level info
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
              IconButton(
                icon: const Icon(Icons.format_align_left, color: Colors.white),
                onPressed: _formatCode,
                tooltip: 'Format code',
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Instructions
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
                onChanged: (value) => widget.onCodeSubmitted(value),
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
