import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyData.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accede a los datos del perfil desde el provider
    final profileData = Provider.of<MyData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nombre: ${profileData.name}'),
            Text('Edad: ${profileData.age}'),
            Text('Género: ${profileData.gender}'),
            Text('País: ${profileData.country}'),
          ],
        ),
      ),
    );
  }
}
