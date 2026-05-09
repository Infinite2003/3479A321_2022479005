import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_application_1/ui/screens/history_screen.dart';
import 'package:flutter_application_1/ui/screens/menu_screen.dart';
import '../widgets/mine_cells.dart';
import 'about.dart';
import '../../models/cell_model.dart';

class MinesweeperScreen extends StatefulWidget {
  const MinesweeperScreen({Key? key}) : super(key: key);

  @override
  State<MinesweeperScreen> createState() => _MinesweeperScreenState();
}

class _MinesweeperScreenState extends State<MinesweeperScreen> {

  late List<CellModel> _cells;

  final logger = Logger();

  @override
  void initState() {
    super.initState();

    _cells = List.generate(
      64,
      (i) => CellModel(index: i),
    );

    logger.i('Lifecycle: initState()');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    logger.i('Lifecycle: didChangeDependencies()');
  }

  @override
  void didUpdateWidget(covariant MinesweeperScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    logger.w('Lifecycle: didUpdateWidget()');
  }

  @override
  void dispose() {
    logger.e('Lifecycle: dispose()');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    logger.i('Lifecycle: build()');

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
            tooltip: 'Ver Historial',

            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),

          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Ir al Menu',

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
              child: _gameBoard(gridSize),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _gameBoard(int gridSize){
final int totalCells = gridSize * gridSize;
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridSize, //8 columnas
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: totalCells,
          itemBuilder: (context, index){
            return MineCell(index: index);
          },
        ),
      ),
    )
  );
}