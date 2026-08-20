import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../game/after_storm_game.dart';

class AfterStormApp extends StatelessWidget {
  const AfterStormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'After Storm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const GameContainerScreen(),
    );
  }
}

class GameContainerScreen extends StatefulWidget {
  const GameContainerScreen({super.key});

  @override
  State<GameContainerScreen> createState() => _GameContainerScreenState();
}

class _GameContainerScreenState extends State<GameContainerScreen> {
  late final AfterStormGame _game;

  @override
  void initState() {
    super.initState();
    _game = AfterStormGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Flame Gameplay Layer
          Positioned.fill(
            child: GameWidget(game: _game),
          ),
          
          // Temporary Foundation Overlay indicator
          // (This will be replaced by our modular UI screens in the next prompts)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const Text(
                    'AFTER STORM — FOUNDATION ACTIVE',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}