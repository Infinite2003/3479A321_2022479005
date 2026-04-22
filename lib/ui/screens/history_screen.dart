import 'package:flutter/material.dart';
import '../../models/game_result.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final GameResult game = GameResult(
      date: '10 octubre', 
      timeSpent: '1:10', 
      isVictory: true);

    return Scaffold(
      appBar: AppBar(title: const Text('Historial (Maqueta)')),
      body: Center(
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Fecha: ${game.date}'),
                const SizedBox(height: 8),
                Text('Tiempo: ${game.timeSpent}'),
              ],
            ),),
        ),
      ),
    );
  }
}