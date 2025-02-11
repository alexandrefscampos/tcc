import 'package:flutter/material.dart';
import 'package:tcc2/data/levels.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/utils/solution_checker.dart';
import 'package:tcc2/widgets/code_input_area.dart';
import 'package:tcc2/widgets/game_area.dart';

class GameScreen extends StatefulWidget {
  final Level initialLevel;

  const GameScreen({
    super.key,
    required this.initialLevel,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Level currentLevel;
  late TextEditingController codeController;
  String? feedbackMessage;
  bool isCorrect = false;
  final List<Level> levels = Levels.getLevels();

  @override
  void initState() {
    super.initState();
    currentLevel = widget.initialLevel;
    codeController = TextEditingController();
    codeController.text = currentLevel.preBuiltCode;
  }

  void _checkSolution(String code) {
    final result = SolutionChecker.checkSolution(
      currentLevel,
      code,
      GameArea.frogKeys,
      GameArea.lilypadKeys,
    );

    setState(() {
      feedbackMessage = result.message;
      isCorrect = result.isCorrect;
    });

    if (result.isCorrect) {
      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Congratulations! 🎉'),
        content: Text('You\'ve completed level ${currentLevel.number}!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _loadNextLevel();
            },
            child: const Text('Next Level'),
          ),
        ],
      ),
    );
  }

  void _loadNextLevel() {
    final currentIndex = levels.indexOf(currentLevel);
    if (currentIndex < levels.length - 1) {
      setState(() {
        currentLevel = levels[currentIndex + 1];
        codeController.clear();
        feedbackMessage = null;
        isCorrect = false;
      });
    } else {
      _showGameCompleteDialog();
    }
  }

  void _showGameCompleteDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('🏆 Game Complete! 🏆'),
        content: const Text(
          'Congratulations! You\'ve mastered Flutter layouts!',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Play Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${currentLevel.number}'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Row(
        children: [
          // Game Area
          Expanded(
            flex: 2,
            child: GameArea(
              level: currentLevel,
              userInput: codeController.text,
            ),
          ),
          // Code Input Area
          Expanded(
            child: CodeInputArea(
              controller: codeController,
              onCodeSubmitted: _checkSolution,
              currentLevel: currentLevel,
              feedbackMessage: feedbackMessage,
              isCorrect: isCorrect,
            ),
          ),
        ],
      ),
    );
  }
}
