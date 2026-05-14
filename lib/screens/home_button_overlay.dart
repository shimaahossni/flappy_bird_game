// screens/home_button_overlay.dart
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class HomeButtonOverlay extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'homeButton';
  
  const HomeButtonOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              // Stop the music
              FlameAudio.bgm.stop();
              
              // Remove overlays
              game.overlays.remove('homeButton');
              game.overlays.remove('gameOver');
              game.overlays.add('mainMenu');
              
              // Pause engine and reset
              game.pauseEngine();
              game.bird.reset();
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red.shade600,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.shade400.withValues(alpha: 0.7),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.home,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

