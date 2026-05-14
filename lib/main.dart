// main.dart
import 'package:flame/game.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/screens/difficulty_selector_screen.dart';
import 'package:flappy_bird_game/screens/game_over_screen.dart';
import 'package:flappy_bird_game/screens/home_button_overlay.dart';
import 'package:flappy_bird_game/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  config.setDifficulty(GameDifficulty.medium);
  final game = FlappyBirdGame(selectedDifficulty: GameDifficulty.medium);
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'difficultySelector': (context, _) =>
            DifficultySelectorScreen(game: game),
        'homeButton': (context, _) => HomeButtonOverlay(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}
// 1- create backround image in file background.dart
// 2- create ground image in file ground.dart
// 3- create bird image in file bird.dart
// 4- create pipe image in file pipe.dart
