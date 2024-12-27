import 'package:flutter/material.dart';
import 'food.dart'; // Import model Food
import 'cart_item.dart'; // Import model CartItem

class CartModel extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Food food) {
    _cartItems.add(CartItem(food: food));
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cartItems.removeWhere((item) => item.food == food);
    notifyListeners();
  }

  int get itemCount => _cartItems.length;
}
