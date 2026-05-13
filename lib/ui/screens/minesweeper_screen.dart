import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/game_view_model.dart';
import '../widgets/mine_cells.dart';

class MinesweeperScreen extends StatelessWidget {

  const MinesweeperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final viewModel =
        context.watch<GameViewModel>();

    final args =
        ModalRoute.of(context)?.settings.arguments
            as Map<String, dynamic>?;

    final String difficulty =
        args?['difficulty'] ?? 'Desconocida';

    final int gridSize =
        args?['gridSize'] ?? 8;

    return Scaffold(

      appBar: AppBar(
        title: const Text('Buscaminas'),

        actions: [

          IconButton(
            icon: const Icon(Icons.history),

            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),

          IconButton(
            icon: const Icon(Icons.menu),

            onPressed: () {
              Navigator.pushNamed(context, '/menu');
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [

            Container(
              height: 60,
              color: Colors.grey[300],

              child: Center(
                child: Text(
                  'Dificultad: $difficulty | Tamaño: $gridSize x $gridSize',

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const Divider(height: 1),

            Expanded(
              child: _gameBoard(viewModel, gridSize),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameBoard(
    GameViewModel viewModel,
    int gridSize,
  ) {

    final int totalCells =
        gridSize * gridSize;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),

        child: AspectRatio(
          aspectRatio: 1.0,

          child: GridView.builder(

            physics:
                const NeverScrollableScrollPhysics(),

            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: gridSize,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),

            itemCount: totalCells,

            itemBuilder: (context, index) {

              final currentCell =
                  viewModel.cells[index];

              return MineCell(

                cell: currentCell,

                onTap: () =>
                    viewModel.revealCell(index),
              );
            },
          ),
        ),
      ),
    );
  }
}

