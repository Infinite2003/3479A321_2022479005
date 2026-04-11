import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'ui/screens/minesweeper_screen.dart';

var logger = Logger();

void main() {
  logger.i('Iniciando la aplicacion de buscaminas');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscaminas',
      theme: ThemeData(
        //Cambio de color principal al tema
        primarySwatch: Colors.blue
      ),
      //Cambie el titulo por mi numero de matricula
      home: const MinesweeperScreen(), 
    );
  }
}