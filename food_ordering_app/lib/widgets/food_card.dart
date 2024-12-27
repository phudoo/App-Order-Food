// widgets/food_card.dart
import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(food.image),
        title: Text(food.name),
        subtitle: Text('\$${food.price.toString()}'),
      ),
    );
  }
}