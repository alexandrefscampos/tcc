import 'package:flutter/material.dart';
import 'package:tcc2/data/levels.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/utils/command_manager.dart';
import 'package:tcc2/utils/solution_checker.dart';
import 'package:tcc2/widgets/code_input_area.dart';
import 'package:tcc2/widgets/game_area.dart';

import '../l10n/app_localizations.dart';

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
  late CommandManager commandManager;
  String? feedbackMessage;
  bool isCorrect = false;
  bool _isLoadingLevel = false;
  bool _isShowingDialog = false;
  late List<Level> levels;
  String _lastCodeText = '';

  @override
  void initState() {
    super.initState();
    currentLevel = widget.initialLevel;
    codeController = TextEditingController();
    commandManager = CommandManager();
    codeController.text = currentLevel.preBuiltCode;
    _lastCodeText = currentLevel.preBuiltCode;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final l10n = AppLocalizations.of(context)!;
    levels = Levels.getLocalizedLevels(l10n);

    // Update current level with localized content
    final currentLevelIndex =
        levels.indexWhere((level) => level.number == currentLevel.number);
    if (currentLevelIndex != -1) {
      currentLevel = levels[currentLevelIndex];
    }
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  void _checkSolution(String code) async {
    if (_isLoadingLevel || _isShowingDialog) {
      return;
    }

    final l10n = AppLocalizations.of(context)!;

    setState(() {
      feedbackMessage = l10n.checkingSolution;
    });

    final result = await SolutionChecker.checkSolution(
      currentLevel,
      code,
      GameArea.frogKeys,
      GameArea.lilypadKeys,
      l10n,
    );

    setState(() {
      feedbackMessage = result.message;
      isCorrect = result.isCorrect;
    });

    if (result.isCorrect && !_isShowingDialog) {
      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    if (_isShowingDialog) {
      return;
    }

    _isShowingDialog = true;
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(l10n.congratulations),
        content: Text(l10n.levelCompleted(currentLevel.number)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _isShowingDialog = false;
              _loadNextLevel();
            },
            child: Text(l10n.nextLevel),
          ),
        ],
      ),
    );
  }

  void _loadNextLevel() {
    final currentIndex = levels.indexOf(currentLevel);

    if (currentIndex < levels.length - 1) {
      _loadLevel(levels[currentIndex + 1]);
    } else {
      _showGameCompleteDialog();
    }
  }

  void _restartGame() {
    _loadLevel(levels.first);
  }

  void _handleTextChange(String newText) {
    if (newText != _lastCodeText) {
      final command = TextEditCommand(
        previousText: _lastCodeText,
        newText: newText,
        onTextChanged: (text) {
          codeController.text = text;
          _lastCodeText = text;
          _checkSolution(text);
        },
      );
      commandManager.executeCommand(command);
      _lastCodeText = newText;
    }
  }

  void _loadLevel(Level newLevel) {
    setState(() {
      _isLoadingLevel = true;
      currentLevel = newLevel;
      feedbackMessage = null;
      isCorrect = false;
    });

    final tempController = TextEditingController(text: newLevel.preBuiltCode);

    codeController.dispose();
    codeController = tempController;

    // Clear command history when loading a new level
    commandManager.clear();
    _lastCodeText = newLevel.preBuiltCode;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isLoadingLevel = false;
      });
    });
  }

  void _showGameCompleteDialog() {
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(l10n.gameComplete),
        content: Text(l10n.gameCompleteMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _restartGame();
            },
            child: Text(l10n.playAgain),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return UndoRedoShortcuts(
      commandManager: commandManager,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.levelNumber(currentLevel.number)),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.undo),
              onPressed: commandManager.canUndo()
                  ? () {
                      commandManager.undo();
                    }
                  : null,
              tooltip: 'Undo (Ctrl+Z)',
            ),
            IconButton(
              icon: const Icon(Icons.redo),
              onPressed: commandManager.canRedo()
                  ? () {
                      commandManager.redo();
                    }
                  : null,
              tooltip: 'Redo (Ctrl+Y)',
            ),
          ],
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
                onTextChanged: _handleTextChange,
                currentLevel: currentLevel,
                feedbackMessage: feedbackMessage,
                isCorrect: isCorrect,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
