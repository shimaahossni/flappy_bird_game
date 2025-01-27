// screens/game_over_screen.dart
//score
//gameOver text
//restart button

import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'gameOver';
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    Size mediaquery = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Score: ${game.bird.score}',
                style:const TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontFamily: 'Game',
                    fontWeight: FontWeight.bold)),
            Image.asset(Assets.gameOver),
            Gap(mediaquery.height * 0.02),
            ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(mediaquery.width * 0.02),
                  ),
                ),
                child: const Text('Restart',
                    style: TextStyle(fontSize: 20, color: Colors.white))),
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
