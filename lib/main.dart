import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tcc2/screens/level_select_screen.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(const FlexFrogGame());
}

class FlexFrogGame extends StatelessWidget {
  const FlexFrogGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Flex Frog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', ''), // Portuguese
        Locale('en', ''), // English
      ],
      locale: const Locale('pt', ''), // Default to Portuguese
      home: const LevelSelectScreen(
        highestUnlockedLevel: 0, // Start with only first level unlocked
      ),
    );
  }
}
