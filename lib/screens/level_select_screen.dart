import 'package:flutter/material.dart';
import 'package:tcc2/data/levels.dart';
import 'package:tcc2/models/level.dart';
import 'package:tcc2/screens/game_screen.dart';
import 'package:tcc2/theme/app_colors.dart';
import 'package:tcc2/theme/app_text_styles.dart';

import '../l10n/app_localizations.dart';

class LevelSelectScreen extends StatelessWidget {
  final int highestUnlockedLevel;

  const LevelSelectScreen({
    super.key,
    required this.highestUnlockedLevel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final levels = Levels.getLocalizedLevels(l10n);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.levelSelectTitle),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.levelSelectGradientStart,
              AppColors.levelSelectGradientEnd,
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
    final l10n = AppLocalizations.of(context)!;

    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.levelButtonBorder,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
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
                        color: AppColors.levelButtonIcon,
                        size: 32,
                      ),
                    Text(
                      l10n.levelNumber(level.number),
                      style: AppTextStyles.buttonText,
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
                    color: AppColors.levelButtonIcon,
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
    if (!isUnlocked) return AppColors.levelButtonUnlocked;
    if (isCompleted) return AppColors.levelButtonCompleted;
    return AppColors.levelButtonAvailable;
  }
}
