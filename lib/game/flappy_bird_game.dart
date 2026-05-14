// game/flappy_bird_game.dart
import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_game/components/background.dart';
import 'package:flappy_bird_game/components/bird.dart';
import 'package:flappy_bird_game/components/ground.dart';
import 'package:flappy_bird_game/components/pipe_group.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/assets.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

//its main class for game
class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  GameDifficulty selectedDifficulty;
  int currentLevel = 1;
  
  FlappyBirdGame({this.selectedDifficulty = GameDifficulty.medium});
  
  late Bird bird;
  late Timer interval;
  bool isHit = false;
  late TextComponent score;
  late TextComponent difficultyText;

  @override
  Future<void> onLoad() async {
    config.setDifficulty(selectedDifficulty);
    FlameAudio.bgm.initialize();
    interval = Timer(config.pipeInterval, repeat: true);
    
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
      difficultyText = buildDifficultyText(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score 0',
      position: Vector2(size.x / 2, size.y / 2 * .2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
          style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontFamily: 'Game',
      )),
    );
  }

  TextComponent buildDifficultyText() {
    String diffText = selectedDifficulty.toString().split('.').last.toUpperCase();
    return TextComponent(
      text: diffText,
      position: Vector2(20, 30),
      anchor: Anchor.topLeft,
      textRenderer: TextPaint(
          style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Game',
        color: Colors.white,
      )),
    );
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score ${bird.score}';
  }
}
