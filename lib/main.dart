import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'welcome_screen.dart';
import 'next_screen.dart';
import 'store_screen.dart';
import 'Thankyou.dart';
import 'check_out.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ('Petmeds.co'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/next': (context) => NextScreen(ownerName: '', petName: '', petBreed: '', petAge: '',),
        '/store': (context) => StoreScreen(),
        '/checkout':(context) => CheckoutPage(),
        '/thankyou':(context) => ThankYouPage(),
      },
    );
  }
}

class Medication {
  final int id;
  final String name;
  final String description;
  final double price;

  Medication({required this.id, required this.name, required this.description, required this.price});

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<Medication>> fetchMedications() async {
    final response = await http.get(Uri.parse('http://192.168.43.132:3306')); // Replace with your API endpoint
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Medication.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load medications');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petmeds.co'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final medications = await fetchMedications();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StorePage(medications: medications),
              ),
            );
          },
          child: const Text('Go to Store'),
        ),
      ),
    );
  }
}

class StorePage extends StatelessWidget {
  final List<Medication> medications;

  const StorePage({required this.medications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication Store'),
      ),
      body: ListView.builder(
        itemCount: medications.length,
        itemBuilder: (context, index) {
          final medication = medications[index];
          return ListTile(
            title: Text(medication.name),
            subtitle: Text(medication.description),
            trailing: Text('\$${medication.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
