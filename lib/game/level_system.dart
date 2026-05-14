// game/level_system.dart

class Reward {
  final String emoji;
  final String title;
  final String description;

  const Reward({
    required this.emoji,
    required this.title,
    required this.description,
  });
}

class LevelConfig {
  final int level;
  final int targetScore;
  final Reward reward;

  const LevelConfig({
    required this.level,
    required this.targetScore,
    required this.reward,
  });
}

class LevelSystem {
  static const int MAX_LEVELS = 5;

  static LevelConfig getLevel(String difficulty, int level) {
    // Basic level generation logic
    int targetScore = level * 10;
    if (difficulty == 'medium') targetScore += 5;
    if (difficulty == 'hard') targetScore += 10;

    return LevelConfig(
      level: level,
      targetScore: targetScore,
      reward: Reward(
        emoji: _getEmoji(level),
        title: 'Level $level Master',
        description: 'You have successfully completed level $level on ${difficulty.toUpperCase()} difficulty!',
      ),
    );
  }

  static String _getEmoji(int level) {
    switch (level) {
      case 1: return '🥉';
      case 2: return '🥈';
      case 3: return '🥇';
      case 4: return '💎';
      case 5: return '👑';
      default: return '⭐';
    }
  }
}
