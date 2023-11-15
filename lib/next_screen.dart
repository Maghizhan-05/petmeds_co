import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  final String ownerName;
  final String petName;
  final String petBreed;
  final String petAge;

  NextScreen({
    required this.ownerName,
    required this.petName,
    required this.petBreed,
    required this.petAge,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Pet Owner\'s Name: $ownerName'),
            Text('Pet Name: $petName'),
            Text('Pet Breed: $petBreed'),
            Text('Pet Age: $petAge'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Store screen
                Navigator.pushNamed(context, '/store');
              },
              child: Text('Go to Store'),
            ),
          ],
        ),
      ),
    );
  }
}
