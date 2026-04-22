import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/game_result_ui.dart';
import '../../models/game_result.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);

  final List<GameResult> listMaqueta = [
    GameResult(date: '10 de Octubre', timeSpent: '1:10', isVictory: false, difficulty: 'Hard'),
    GameResult(date: '2 de Abril', timeSpent: '0:50', isVictory: false, difficulty: 'Hard'),
    GameResult(date: '5 de Junio', timeSpent: '2:20', isVictory: true, difficulty: 'Easy'),
    GameResult(date: '11 de Mayo', timeSpent: '4:10', isVictory: true, difficulty: 'Medium'),
    GameResult(date: '13 de Junio', timeSpent: '2:15', isVictory: false, difficulty: 'Medium'),
    GameResult(date: '28 de Marzo', timeSpent: '1:30', isVictory: true, difficulty: 'Easy'),
    GameResult(date: '15 de Abril', timeSpent: '1:11', isVictory: false, difficulty: 'Easy'),
    GameResult(date: '2 de Octubre', timeSpent: '0:55', isVictory: true, difficulty: 'Medium'),
    GameResult(date: '1 de Enero', timeSpent: '0:59', isVictory: false, difficulty: 'Hard'),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Historial (Maqueta)')),
      body: 
        ListView.builder(itemBuilder: (context, index){
          final game = listMaqueta[index];
          return GameResultUi(game: game);
        },
        itemCount: listMaqueta.length,
        ),
    );
  }
}