// screens/level_complete_screen.dart
import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/game/level_system.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class LevelCompleteScreen extends StatefulWidget {
  final FlappyBirdGame game;
  static const String id = 'levelComplete';

  const LevelCompleteScreen({super.key, required this.game});

  @override
  State<LevelCompleteScreen> createState() => _LevelCompleteScreenState();
}

class _LevelCompleteScreenState extends State<LevelCompleteScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String difficultyName =
        widget.game.selectedDifficulty.toString().split('.').last.toUpperCase();
    LevelConfig currentLevel = LevelSystem.getLevel(
      difficultyName.toLowerCase(),
      widget.game.currentLevel,
    );

    bool isLastLevel = widget.game.currentLevel == LevelSystem.MAX_LEVELS;
    bool canAdvanceDifficulty = isLastLevel &&
        widget.game.selectedDifficulty != GameDifficulty.hard;

    return Material(
      color: Colors.transparent,
      child: Center(
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepPurple.shade900,
                  Colors.blue.shade900,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.cyanAccent,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyanAccent.withValues(alpha: 0.5),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Reward Emoji
                  Text(
                    currentLevel.reward.emoji,
                    style: const TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 20),

                  // Level Complete Text
                  const Text(
                    'LEVEL COMPLETE!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                      fontFamily: 'Game',
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Difficulty and Level
                  Text(
                    '$difficultyName - Level ${widget.game.currentLevel}/${LevelSystem.MAX_LEVELS}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      fontFamily: 'Game',
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Score
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.cyan.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.cyan, width: 2),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Your Score',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontFamily: 'Game',
                          ),
                        ),
                        Text(
                          '${widget.game.bird.score}',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyanAccent,
                            fontFamily: 'Game',
                          ),
                        ),
                        Text(
                          'Target: ${currentLevel.targetScore}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            fontFamily: 'Game',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Reward
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.amber.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.amber, width: 2),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          '🎁 Reward Unlocked',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                            fontFamily: 'Game',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          currentLevel.reward.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Game',
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          currentLevel.reward.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            fontFamily: 'Game',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Progression Message
                  if (!isLastLevel)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.greenAccent, width: 2),
                      ),
                      child: const Text(
                        '✅ You are eligible to proceed to the next level!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Game',
                        ),
                      ),
                    )
                  else if (canAdvanceDifficulty)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.amber.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.amberAccent, width: 2),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            '🎊 Congratulations!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Game',
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'You have mastered this difficulty!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'Game',
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '✅ Ready to advance to the next difficulty level?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Game',
                            ),
                          ),
                        ],
                      ),
                    )
                  else if (widget.game.selectedDifficulty == GameDifficulty.hard)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange, width: 2),
                      ),
                      child: const Text(
                        '👑 YOU ARE THE ULTIMATE CHAMPION!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Game',
                        ),
                      ),
                    ),
                  const SizedBox(height: 25),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Next Level Button
                      if (!isLastLevel)
                        ElevatedButton(
                          onPressed: _nextLevel,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Next Level',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Game',
                            ),
                          ),
                        ),
                      // Advance Difficulty Button
                      if (canAdvanceDifficulty)
                        ElevatedButton(
                          onPressed: _advanceDifficulty,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber.shade600,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Next Difficulty',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Game',
                            ),
                          ),
                        ),
                      // Restart or Menu Button
                      ElevatedButton(
                        onPressed: _restart,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade600,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          isLastLevel ? 'Menu' : 'Restart',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Game',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _nextLevel() {
    widget.game.currentLevel++;
    widget.game.bird.reset();
    widget.game.overlays.remove('levelComplete');
    widget.game.resumeEngine();
    FlameAudio.bgm.play(Assets.bgm);
  }

  void _advanceDifficulty() {
    // Advance to next difficulty
    if (widget.game.selectedDifficulty == GameDifficulty.easy) {
      widget.game.selectedDifficulty = GameDifficulty.medium;
    } else if (widget.game.selectedDifficulty == GameDifficulty.medium) {
      widget.game.selectedDifficulty = GameDifficulty.hard;
    }

    config.setDifficulty(widget.game.selectedDifficulty);
    widget.game.currentLevel = 1;
    widget.game.bird.reset();
    widget.game.overlays.remove('levelComplete');
    widget.game.resumeEngine();
    FlameAudio.bgm.play(Assets.bgm);
  }

  void _restart() {
    if (widget.game.currentLevel == LevelSystem.MAX_LEVELS &&
        widget.game.selectedDifficulty == GameDifficulty.hard) {
      // Go to menu if hard mode completed
      FlameAudio.bgm.stop();
      widget.game.overlays.remove('levelComplete');
      widget.game.overlays.remove('homeButton');
      widget.game.overlays.add('mainMenu');
      widget.game.pauseEngine();
      widget.game.bird.reset();
    } else {
      // Restart current level
      widget.game.bird.reset();
      widget.game.overlays.remove('levelComplete');
      widget.game.resumeEngine();
      FlameAudio.bgm.play(Assets.bgm);
    }
  }
}
