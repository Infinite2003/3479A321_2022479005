import 'package:flutter/material.dart';

class MineCell extends StatelessWidget {
  final int index;
  const MineCell({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        border: Border.all(
          color: theme.colorScheme.outline, 
          width: 1.5),
      ),
      child: Center(
        child: Image.asset('assets/icons/Bomb.png',
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}