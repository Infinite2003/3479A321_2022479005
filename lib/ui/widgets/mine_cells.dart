import 'package:flutter/material.dart';
import '../../models/cell_model.dart';

class MineCell extends StatelessWidget {
  final CellModel cell;
  final VoidCallback onTap;

  const MineCell({
    Key? key,
    required this.cell,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(

      onTap: onTap,

      child: Container(

        decoration: BoxDecoration(

          color: cell.isRevealed
            ? Colors.grey[300]
            : Colors.grey[500],

          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),

        child: Center(
          child: _buildCellContent(),
        ),
      ),
    );
  }

  Widget _buildCellContent(){

    if(!cell.isRevealed){

      return const SizedBox.shrink();
    }

    if(cell.isBomb){

      return Image.asset(
        'assets/icons/Bomb.png',
        width: 40,
        height: 40,
        fit: BoxFit.contain
        );
    }

    return Text(

      '${cell.index}',

      style: const TextStyle(
        
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
      ),
    );
  }
}