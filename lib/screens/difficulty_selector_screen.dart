// screens/difficulty_selector_screen.dart
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bird_game/game/assets.dart';

class DifficultySelectorScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'difficultySelector';
  
  const DifficultySelectorScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple.shade900,
              Colors.blue.shade900,
              Colors.cyan.shade900,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'SKY RUNNER',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Game',
                  shadows: [
                    Shadow(
                      color: Colors.cyan,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              const Text(
                'Select Difficulty',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              const SizedBox(height: 40),
              _buildDifficultyButton(
                context,
                'EASY',
                GameDifficulty.easy,
                Colors.green,
                Colors.greenAccent,
                'Slower speed,\nWider gaps',
              ),
              const SizedBox(height: 20),
              _buildDifficultyButton(
                context,
                'MEDIUM',
                GameDifficulty.medium,
                Colors.orange,
                Colors.orangeAccent,
                'Balanced\nchallenge',
              ),
              const SizedBox(height: 20),
              _buildDifficultyButton(
                context,
                'HARD',
                GameDifficulty.hard,
                Colors.red,
                Colors.redAccent,
                'Fast speed,\nNarrow gaps',
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyButton(
    BuildContext context,
    String label,
    GameDifficulty difficulty,
    Color color,
    Color accentColor,
    String description,
  ) {
    return GestureDetector(
      onTap: () {
        config.setDifficulty(difficulty);
        game.selectedDifficulty = difficulty;
        game.overlays.remove('difficultySelector');
        game.overlays.remove('mainMenu');
        game.overlays.add('homeButton');
        game.resumeEngine();
        FlameAudio.bgm.stop();
        FlameAudio.bgm.play(Assets.bgm);
      },
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.3),
          border: Border.all(
            color: accentColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: accentColor.withValues(alpha: 0.5),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: accentColor,
                fontFamily: 'Game',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
