import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';



import 'MyData.dart';

class PersonInfo extends StatefulWidget {
  const PersonInfo({Key? key}) : super(key: key);

  @override
  _PersonInfoState createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {
  // Create controllers for each text field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers to free up resources
    nameController.dispose();
    ageController.dispose();
    genderController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<MyData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Person Information Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image above text fields
            Image.asset(
              gameProvider.photoURL, // Use the photoURL from MyData
              width: 150, // Adjust the width as needed
            ),
            SizedBox(height: 16), // Spacing between image and text fields
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nameController, // Assign the controller
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    controller: ageController, // Assign the controller
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number, // Set input type to number
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly, // Allow only digits
                    ],
                  ),
                  TextFormField(
                    controller: genderController, // Assign the controller
                    decoration: InputDecoration(labelText: 'Gender'),
                  ),
                  TextFormField(
                    controller: countryController, // Assign the controller
                    decoration: InputDecoration(labelText: 'Country'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0), // Add padding to the button
                    child:ElevatedButton(
                      onPressed: () {
                        final name = nameController.text;
                        final age = ageController.text;
                        final gender = genderController.text;
                        final country = countryController.text;
                        if (name.isEmpty || age.isEmpty || gender.isEmpty || country.isEmpty) {
                          // Muestra un mensaje de error si algún campo está vacío
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Por favor, completa todos los campos'), // Mensaje de error
                              duration: Duration(seconds: 2), // Duración del mensaje
                            ),
                          );
                        }
                        else{
                          gameProvider.updateProfile(name,age,gender,country);
                          Navigator.of(context).pushNamed('/Perfil');
                        }
                        // Navega a la nueva ruta ("perfil") y pasa los datos como argumentos

                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12.0), // Add padding to the button text
                        child: Text('Save'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
