import 'package:flutter/material.dart';
import 'package:tcc2/screens/level_select_screen.dart';

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
      home: const LevelSelectScreen(
        highestUnlockedLevel: 0, // Start with only first level unlocked
      ),
    );
  }
}
