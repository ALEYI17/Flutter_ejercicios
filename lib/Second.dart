import 'package:flutter/material.dart';

import 'SecondPage.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20), // Espacio entre los botones
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second'); // Navegar a la ruta '/second'
              },
              child: Text('Botón 1'),
            ),
            const SizedBox(height: 10), // Espacio entre los botones
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/personInfo');
                // Agrega la acción para el segundo botón aquí
              },
              child: Text('Botón 2'),
            ),
            const SizedBox(height: 10), // Espacio entre los botones
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Perfil');
                // Agrega la acción para el tercer botón aquí
              },
              child: Text('Botón 3'),
            ),
          ],
        ),
      ),
    );
  }
}
