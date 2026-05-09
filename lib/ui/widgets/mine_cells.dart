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
          color: Colors.grey[400],
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),

        child: Center(

          child: cell.isRevealed
              ? const Icon(Icons.circle, size: 18)
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}