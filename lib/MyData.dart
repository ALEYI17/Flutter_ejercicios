import 'package:flutter/material.dart';
import 'dart:math';

class MyData extends ChangeNotifier {
  int lives = 3;
  int score = 0;
  int numberToGuess = _generateRandomNumber(); // Genera un número aleatorio al inicio
  String photoURL = 'images/grandfather_2996683.png';
  String photoURL2 = 'images/house_619032.png';
  String name = '';
  String age = '';
  String gender = '';
  String country = '';

  static int _generateRandomNumber() {
    final random = Random();
    final randomNumber = random.nextInt(10) + 1;

    return randomNumber; // Genera un número aleatorio entre 0 y 99
  }

  void checkGuess(String guess) {
    // Lógica para comprobar la adivinanza
    // ...

    // Actualiza las vidas y el puntaje
    if (guess != numberToGuess.toString()) { // Compara el guess con el número aleatorio
      lives--;
    } else {
      score++;
      numberToGuess = _generateRandomNumber(); // Genera un nuevo número aleatorio
    }

    // Notifica a los oyentes (widgets) que los datos han cambiado
    notifyListeners();
  }

  void resetGame() {
    lives = 3; // Restablece las vidas a 3
    score = 0; // Restablece el puntaje a 0
    numberToGuess = _generateRandomNumber(); // Genera un nuevo número aleatorio

    notifyListeners();
  }

  void updateProfile(String name, String age, String gender, String country) {
    this.name = name;
    this.age = age;
    this.gender = gender;
    this.country = country;
    notifyListeners();
  }
}
