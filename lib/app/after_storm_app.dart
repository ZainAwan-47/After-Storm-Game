import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game/after_storm_game.dart';

class AfterStormApp extends StatelessWidget {
  const AfterStormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'After Storm',
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      home: const AfterStormGameScreen(),
    );
  }
}

class AfterStormGameScreen extends StatefulWidget {
  const AfterStormGameScreen({super.key});

  @override
  State<AfterStormGameScreen> createState() => _AfterStormGameScreenState();
}

class _AfterStormGameScreenState extends State<AfterStormGameScreen> {
  late final AfterStormGame _game;

  @override
  void initState() {
    super.initState();
    _game = AfterStormGame();
  }

  @override
  void dispose() {
    _game.pauseEngine();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GameWidget(game: _game));
  }
}
