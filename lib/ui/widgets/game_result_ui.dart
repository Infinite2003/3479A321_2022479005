import 'package:flutter/material.dart';
import '../../models/game_result.dart';

class GameResultUi extends StatelessWidget{
  final GameResult game;

  const GameResultUi({
  Key? key,
  required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fecha: ${game.date}'),
            Text('Tiempo: ${game.timeSpent}'),
            Text('Dificultad: ${game.difficulty}'),
            Text(
              game.isVictory ? 'Victoria' : 'Derrota',
              style: TextStyle(
                color: game.isVictory ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

}