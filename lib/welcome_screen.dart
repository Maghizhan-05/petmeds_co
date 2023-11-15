import 'package:flutter/material.dart';
import 'next_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController petNameController = TextEditingController();
  final TextEditingController petBreedController = TextEditingController();
  final TextEditingController petAgeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: ownerNameController,
              decoration: InputDecoration(labelText: 'Pet Owner\'s Name'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: petNameController,
              decoration: InputDecoration(labelText: 'Pet Name'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: petBreedController,
              decoration: InputDecoration(labelText: 'Pet Breed'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: petAgeController,
              decoration: InputDecoration(labelText: 'Pet Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Get the user input from the controllers
                final ownerName = ownerNameController.text;
                final petName = petNameController.text;
                final petBreed = petBreedController.text;
                final petAge = petAgeController.text;

                // Navigate to the next screen with the collected data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextScreen(
                      ownerName: ownerName,
                      petName: petName,
                      petBreed: petBreed,
                      petAge: petAge,
                    ),
                  ),
                );
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    ownerNameController.dispose();
    petNameController.dispose();
    petBreedController.dispose();
    petAgeController.dispose();
    super.dispose();
  }
}
