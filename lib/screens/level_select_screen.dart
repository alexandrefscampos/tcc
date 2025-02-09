import 'package:flutter/material.dart';
import 'package:tcc2/data/levels.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/screens/game_screen.dart';

class LevelSelectScreen extends StatelessWidget {
  final int highestUnlockedLevel;

  const LevelSelectScreen({
    super.key,
    required this.highestUnlockedLevel,
  });

  @override
  Widget build(BuildContext context) {
    final levels = Levels.getLevels();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Flex Frog - Levels'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightBlue[200]!,
              Colors.lightBlue[800]!,
            ],
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: levels.length,
          itemBuilder: (context, index) {
            final level = levels[index];
            const isUnlocked = true;

            return LevelButton(
              level: level,
              isUnlocked: isUnlocked,
              isCompleted: index < highestUnlockedLevel,
              onTap: isUnlocked
                  ? () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameScreen(
                            initialLevel: level,
                          ),
                        ),
                      )
                  : null,
            );
          },
        ),
      ),
    );
  }
}

class LevelButton extends StatelessWidget {
  final Level level;
  final bool isUnlocked;
  final bool isCompleted;
  final VoidCallback? onTap;

  const LevelButton({
    super.key,
    required this.level,
    required this.isUnlocked,
    required this.isCompleted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isUnlocked)
                      const Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 32,
                      ),
                    Text(
                      'Level ${level.number}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (isCompleted)
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (!isUnlocked) return Colors.grey;
    if (isCompleted) return Colors.green;
    return Colors.blue;
  }
}
