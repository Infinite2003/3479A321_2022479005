import 'package:flutter/material.dart';

class MineCell extends StatelessWidget {
  final int index;
  const MineCell({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[400],
        border: Border.all(color: Colors.red[600]!, width: 1.5),
      ),
    );
  }
}