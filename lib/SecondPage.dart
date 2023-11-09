import 'package:ejercicio_flutter/MyData.dart'; // Asegúrate de importar MyData
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<MyData>(context);

    bool isGameOver = gameProvider.lives == 0; // Verifica si el juego ha terminado

    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego de Adivinanza'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Número a adivinar:'),
            Text(
              gameProvider.numberToGuess.toString(),
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16.0),
            const Text('Adivina la respuesta:'),
            Container(
              margin: EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                enabled: !isGameOver, // Deshabilita el campo de texto si el juego ha terminado
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (!isGameOver) {
                  String guess = _textController.text;
                  gameProvider.checkGuess(guess);
                  _textController.clear();
                }
              },
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: const Text('Adivinar'),
              ),
              // Deshabilita el botón si el juego ha terminado
              style: ButtonStyle(
                backgroundColor: isGameOver
                    ? MaterialStateProperty.all(Colors.grey)
                    : MaterialStateProperty.all(null),
              ),
            ),
            Text('Vidas restantes: ${gameProvider.lives}'),
            Text('Puntaje: ${gameProvider.score}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gameProvider.resetGame(); // Agrega una función para reiniciar el juego
          _textController.clear(); // Limpia el campo de texto
        },
        child: Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
