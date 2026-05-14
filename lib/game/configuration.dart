// game/configuration.dart
enum GameDifficulty { easy, medium, hard }

class DifficultySettings {
  final GameDifficulty difficulty;
  late double gameSpeed;
  late double pipeInterval;
  late double birdVelocity;
  late double pipeGap;

  DifficultySettings(this.difficulty) {
    switch (difficulty) {
      case GameDifficulty.easy:
        gameSpeed = 150.0;
        pipeInterval = 2.0;
        birdVelocity = 210;
        pipeGap = 150.0;
        break;
      case GameDifficulty.medium:
        gameSpeed = 200.0;
        pipeInterval = 1.5;
        birdVelocity = 210;
        pipeGap = 120.0;
        break;
      case GameDifficulty.hard:
        gameSpeed = 280.0;
        pipeInterval = 1.2;
        birdVelocity = 240;
        pipeGap = 100.0;
        break;
    }
  }
}

class config {
  static const double groundHeight = 110.0;
  static const double gravity = -100.0;
  static late DifficultySettings difficulty;

  static void setDifficulty(GameDifficulty level) {
    difficulty = DifficultySettings(level);
  }

  // Getters that use difficulty settings
  static double get gameSpeed => difficulty.gameSpeed;
  static double get pipeInterval => difficulty.pipeInterval;
  static double get birdVelocity => difficulty.birdVelocity;
  static double get pipeGap => difficulty.pipeGap;
}
