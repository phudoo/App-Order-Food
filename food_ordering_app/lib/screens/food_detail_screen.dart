import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/food.dart';

class FoodDetailScreen extends StatelessWidget {
  final Food food;

  // Constructor to receive Food object
  FoodDetailScreen({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display food image
            Image.network(food.image, height: 250, fit: BoxFit.cover),
            
            SizedBox(height: 16),
            
            // Food Name
            Text(
              food.name,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 8),
            
            // Food Description
            Text(
              food.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            
            SizedBox(height: 16),
            
            // Price of the Food
            Text(
              '\$${food.price.toString()}',
              style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 32),
            
            // Order Button
            ElevatedButton(
              onPressed: () {
                // Logic to add to cart or handle food ordering
              },
              child: Text('Order Now'),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
            ),
          ],
        ),
      ),
    );
  }
}
