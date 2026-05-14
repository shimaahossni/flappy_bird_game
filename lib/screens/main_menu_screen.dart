// screens/main_menu_screen.dart
import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/screens/difficulty_selector_screen.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';
  const MainMenuScreen({super.key, required this.game});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  GameDifficulty? selectedDifficulty;

  @override
  Widget build(BuildContext context) {
    widget.game.pauseEngine();

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
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Game',
                  shadows: [
                    Shadow(
                      color: Colors.cyan,
                      blurRadius: 15,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '🦋 Navigate the Skies 🦋',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.cyanAccent,
                  fontFamily: 'Game',
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 60),
              Image.asset(
                Assets.message,
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  FlameAudio.bgm.stop();
                  widget.game.overlays.add(DifficultySelectorScreen.id);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.cyan, Colors.blue.shade400],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyan.withValues(alpha: 0.7),
                        blurRadius: 20,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const Text(
                    'TAP TO PLAY',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Game',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              const Text(
                'Tap the bird to fly • Avoid pipes • Reach the sky!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  fontFamily: 'Game',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
