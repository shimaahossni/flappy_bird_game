// components/pipe.dart
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  //height of the pipe and it changes random
  //pipe position
  //pipe and bird collide

  @override
  final double height;
  final PipePosition pipePosition;
  Pipe({required this.height, required this.pipePosition});

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(
      RectangleHitbox(),
    );
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);

    size = Vector2(52, height);

    //position of the pipe
    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }
  }
}
