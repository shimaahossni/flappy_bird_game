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
import 'package:flutter/material.dart';

//its main class for game
class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();
  late Bird bird;
  Timer interval = Timer(config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      // PipeGroup(),
      score = buildScore(),
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
