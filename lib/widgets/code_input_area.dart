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
          Text(
            'Level ${widget.currentLevel.number}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
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

          // Available properties
          Text(
            'Available Properties:',
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          Wrap(
            spacing: 8,
            children: widget.currentLevel.allowedProperties
                .map((prop) => Chip(
                      label: Text(prop),
                      backgroundColor: Colors.blue[700],
                      labelStyle: const TextStyle(color: Colors.white),
                    ))
                .toList(),
          ),
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
          const SizedBox(height: 16),

          // Run button
          ElevatedButton.icon(
            onPressed: () => widget.onCodeSubmitted(widget.controller.text),
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.isCorrect ? Colors.green : Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            icon: Icon(widget.isCorrect ? Icons.check : Icons.play_arrow),
            label: Text(widget.isCorrect ? 'Completed!' : 'Run Code'),
          ),

          // Hint button
          TextButton.icon(
            onPressed: () => _showHint(context),
            icon: const Icon(Icons.lightbulb_outline),
            label: const Text('Need a hint?'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.yellow,
            ),
          ),

          if (widget.currentLevel.explanation != null)
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.currentLevel.explanation!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  void _showHint(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hint'),
        content: Text(widget.currentLevel.hint ??
            'Try experimenting with different values!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it!'),
          ),
        ],
      ),
    );
  }
}
