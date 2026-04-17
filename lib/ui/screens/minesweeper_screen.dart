import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/history_screen.dart';
import 'package:flutter_application_1/ui/screens/menu_screen.dart';
import '../widgets/mine_cells.dart';
import 'about.dart';

class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscaminas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {

            Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AboutScreen())
              );
          },
        ),
        
        IconButton(
          icon: const Icon(Icons.history),
          tooltip: 'Ver Historial',
          onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const HistoryScreen()),
            );
          },),

        IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Ir al Menu',
          onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const MenuScreen()),
            );
          },)
      ],
      ),
      
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'STATUS: 349 segundos | Minas: 10| Cuadros: 56',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const Divider(height: 1),

            Expanded(
              child: _gameBoard(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _gameBoard(){

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8, //8 columnas
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: 64,
          itemBuilder: (context, index){
            return MineCell(index: index);
          },
        ),
      ),
    )
  );
}