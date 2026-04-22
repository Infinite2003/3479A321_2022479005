import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/about.dart';
import 'package:flutter_application_1/ui/screens/history_screen.dart';
import 'package:flutter_application_1/ui/screens/menu_screen.dart';
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          primary: Colors.cyan,
          secondary: Colors.greenAccent
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 60, 15, 74),

        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        useMaterial3: true,
      ),
      //Cambie el titulo por mi numero de matricula
      initialRoute: '/menu',

      routes: {
        '/menu': (context) => const MenuScreen(),
        '/game': (context) => const MinesweeperScreen(),
        '/history': (context) => HistoryScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}