// models/cart_item.dart
import 'package:food_ordering_app/models/food.dart';

class CartItem {
  final Food food;
  int quantity;

  CartItem({required this.food, this.quantity = 1});
}
