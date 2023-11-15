import 'package:flutter/material.dart';
import 'check_out.dart';

class MedicationItem {
  final String name;
  final double price;
  final String imagePath;

  MedicationItem({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

class StoreScreen extends StatefulWidget {
  final List<MedicationItem> medications = [
    MedicationItem(
      name: 'Vitamin C supplement',
      price: 19.99,
      imagePath: 'assets\\medication1.jpeg',
    ),
    MedicationItem(
      name: 'Vitamin D supplement ',
      price: 29.99,
      imagePath: 'assets\\medication1.jpeg',
    ),
    MedicationItem(
      name: 'Bone supplement ',
      price: 19.99,
      imagePath: 'assets\\medication1.jpeg',
    ),
    MedicationItem(
      name: 'Hearing supplement ',
      price: 39.99,
      imagePath: 'assets\\medication1.jpeg',
    ),
    MedicationItem(
      name: 'Eyesight supplement ',
      price: 19.99,
      imagePath: 'assets\\medication1.jpeg',
    ),
    MedicationItem(
      name: 'Vitamin B supplement ',
      price: 19.99,
      imagePath: 'assets\\medication1.jpeg',
    ),
    MedicationItem(
      name: 'Vitamin A supplement',
      price: 19.99,
      imagePath: 'assets\\medication1.jpeg',
    ),
    MedicationItem(
      name: 'Biotin supplement ',
      price: 19.99,
      imagePath: 'assets\\medication1.jpeg',
    ),
    MedicationItem(
      name: 'Calcium supplement ',
      price: 19.99,
      imagePath: 'assets\\medication1.jpeg',
    ),// Your medication items go here
  ];

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List<MedicationItem> cartItems = [];
  Map<MedicationItem, int> itemQuantities = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication Store'),
      ),
      body: ListView.builder(
        itemCount: widget.medications.length,
        itemBuilder: (context, index) {
          final medication = widget.medications[index];
          final isItemInCart = cartItems.contains(medication);
          final quantity = itemQuantities[medication] ?? 0;

          return ListTile(
              leading: Container(
              width: 80,
              height: 80,
              child: Image.asset(
              medication.imagePath,
              fit: BoxFit.cover,
              ),
              ),
            title: Text(medication.name),
            subtitle: Text('\$${medication.price.toStringAsFixed(2)}'),
            trailing: isItemInCart
                ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('$quantity'),
                IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        itemQuantities[medication] = quantity - 1;
                      });
                    } else {
                      setState(() {
                        itemQuantities.remove(medication);
                        cartItems.remove(medication);
                      });
                    }
                  },
                  icon: Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      itemQuantities[medication] = quantity + 1;
                    });
                  },
                  child: Text('Add More'),
                ),
              ],
            )
                : ElevatedButton(
              onPressed: () {
                setState(() {
                  itemQuantities[medication] = 1;
                  cartItems.add(medication);
                });
              },
              child: Text('Add to Cart'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the checkout page when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutPage(),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

