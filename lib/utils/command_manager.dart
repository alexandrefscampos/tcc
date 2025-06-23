import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Abstract base class for all commands
abstract class Command {
  void execute();
  void undo();
}

/// Command for text editing operations
class TextEditCommand extends Command {
  final String _previousText;
  final String _newText;
  final Function(String) _onTextChanged;

  TextEditCommand({
    required String previousText,
    required String newText,
    required Function(String) onTextChanged,
  })  : _previousText = previousText,
        _newText = newText,
        _onTextChanged = onTextChanged;

  @override
  void execute() {
    _onTextChanged(_newText);
  }

  @override
  void undo() {
    _onTextChanged(_previousText);
  }

  /// Check if this command can be merged with another command
  bool canMergeWith(TextEditCommand other) {
    // Simple merge logic: if the previous text of the new command
    // matches the new text of this command, they can be merged
    return _newText == other._previousText;
  }

  /// Merge this command with another command
  TextEditCommand mergeWith(TextEditCommand other) {
    return TextEditCommand(
      previousText: _previousText,
      newText: other._newText,
      onTextChanged: _onTextChanged,
    );
  }
}

/// Manages the command history for undo/redo functionality
class CommandManager {
  final List<Command> _history = [];
  int _currentIndex = -1;
  DateTime _lastCommandTime = DateTime.now();

  // Merge commands that occur within this time window (in milliseconds)
  static const int _mergeTimeWindow = 1000;

  /// Execute a command and add it to the history
  void executeCommand(Command command) {
    // If we're not at the end of history, remove everything after current position
    if (_currentIndex < _history.length - 1) {
      _history.removeRange(_currentIndex + 1, _history.length);
    }

    // Try to merge with the last command if it's a TextEditCommand
    final now = DateTime.now();
    if (_history.isNotEmpty &&
        _currentIndex >= 0 &&
        command is TextEditCommand &&
        _history[_currentIndex] is TextEditCommand &&
        now.difference(_lastCommandTime).inMilliseconds < _mergeTimeWindow) {
      final lastCommand = _history[_currentIndex] as TextEditCommand;
      if (lastCommand.canMergeWith(command)) {
        // Replace the last command with the merged command
        _history[_currentIndex] = lastCommand.mergeWith(command);
        _lastCommandTime = now;
        return;
      }
    }

    // Add the new command
    _history.add(command);
    _currentIndex++;
    _lastCommandTime = now;

    // Limit history size to prevent memory issues
    if (_history.length > 100) {
      _history.removeAt(0);
      _currentIndex--;
    }
  }

  /// Undo the last command
  bool undo() {
    if (canUndo()) {
      _history[_currentIndex].undo();
      _currentIndex--;
      return true;
    }
    return false;
  }

  /// Redo the next command
  bool redo() {
    if (canRedo()) {
      _currentIndex++;
      _history[_currentIndex].execute();
      return true;
    }
    return false;
  }

  /// Check if undo is possible
  bool canUndo() {
    return _currentIndex >= 0;
  }

  /// Check if redo is possible
  bool canRedo() {
    return _currentIndex < _history.length - 1;
  }

  /// Clear the command history
  void clear() {
    _history.clear();
    _currentIndex = -1;
  }

  /// Get the current history size
  int get historySize => _history.length;

  /// Get the current position in history
  int get currentPosition => _currentIndex;
}

/// Keyboard shortcuts handler for undo/redo
class UndoRedoShortcuts extends StatelessWidget {
  final CommandManager commandManager;
  final Widget child;

  const UndoRedoShortcuts({
    super.key,
    required this.commandManager,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        // Cmd+Z for undo (macOS) or Ctrl+Z (Windows/Linux)
        LogicalKeySet(
          LogicalKeyboardKey.meta,
          LogicalKeyboardKey.keyZ,
        ): const UndoIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.keyZ,
        ): const UndoIntent(),

        // Cmd+Shift+Z for redo (macOS) or Ctrl+Y (Windows/Linux)
        LogicalKeySet(
          LogicalKeyboardKey.meta,
          LogicalKeyboardKey.shift,
          LogicalKeyboardKey.keyZ,
        ): const RedoIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.keyY,
        ): const RedoIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.shift,
          LogicalKeyboardKey.keyZ,
        ): const RedoIntent(),
      },
      child: Actions(
        actions: {
          UndoIntent: CallbackAction<UndoIntent>(
            onInvoke: (intent) {
              commandManager.undo();
              return null;
            },
          ),
          RedoIntent: CallbackAction<RedoIntent>(
            onInvoke: (intent) {
              commandManager.redo();
              return null;
            },
          ),
        },
        child: child,
      ),
    );
  }
}

/// Intent for undo action
class UndoIntent extends Intent {
  const UndoIntent();
}

/// Intent for redo action
class RedoIntent extends Intent {
  const RedoIntent();
}
