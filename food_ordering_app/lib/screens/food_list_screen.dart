// screens/food_list_screen.dart
import 'package:flutter/material.dart';
import '../services/food_service.dart';
import '../models/food.dart';
import '../widgets/food_card.dart';

class FoodListScreen extends StatefulWidget {
  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  final FoodService _foodService = FoodService();
  late Future<List<Food>> _foods;

  @override
  void initState() {
    super.initState();
    _foods = _foodService.fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food List')),
      body: FutureBuilder<List<Food>>(
        future: _foods,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No foods available'));
          } else {
            return ListView(
              children: snapshot.data!.map((food) => FoodCard(food: food)).toList(),
            );
          }
        },
      ),
    );
  }
}
