// components/ground.dart
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';

class Ground extends ParallaxComponent<FlappyBirdGame>
    with HasGameRef<FlappyBirdGame> {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final ground = await Flame.images.load(Assets.ground);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(
          ground,
          fill: LayerFill.none,
        ),
      ),
    ]);
    add(RectangleHitbox(
      position: Vector2(0, gameRef.size.y - config.groundHeight),
      size: Vector2(gameRef.size.x, config.groundHeight),
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = config.gameSpeed;
  }
}
