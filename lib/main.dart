import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Taller 2',
      theme: ThemeData(
        //Cambio de color principal al tema
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      //Cambie el titulo por mi numero de matricula
      home: const MyHomePage(title: '2022479005'), 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final int _defaultValue = 0;
  Color _customeColor = Colors.blue; 

  //Sumar
  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  //Restar
  void _decrementCounter(){

    setState(() {

      _counter--;
    });
  }

  //Restaurar
  void _resetCounter(){

    setState(() {

      _counter = _defaultValue;
    });
  }

  //Cambiar Color
  void _changeColor(){

    setState(() {
      _customeColor = _customeColor == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  //Botones
  List<Widget> _buildFooterButtons(){

    return[
      IconButton(onPressed: _decrementCounter, icon: const Icon(Icons.remove)),
      IconButton(onPressed: _incrementCounter, icon: const Icon(Icons.add)),
      IconButton(onPressed: _resetCounter, icon: const Icon(Icons.restore)),
      IconButton(onPressed: _changeColor, icon: const Icon(Icons.color_lens))
    ];
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: _customeColor, // Fondo dinámico según _customColor
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Texto cambiado a español
              const Text(
                'Pixel Art sobre una grilla personalizable',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        // Ícono cambiado a uno de arte/pintura
        child: const Icon(Icons.palette),
      ),
      // Botones persistentes en el pie de pantalla
      persistentFooterButtons: _buildFooterButtons(),
    );
  }
}
