import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/cart_model.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.cartItems.isEmpty) {
            return Center(child: Text('Your cart is empty!'));
          }
          return ListView.builder(
            itemCount: cart.cartItems.length,
            itemBuilder: (context, index) {
              CartItem cartItem = cart.cartItems[index];
              return ListTile(
                title: Text(cartItem.food.name),
                subtitle: Text('Quantity: ${cartItem.quantity}'),
                trailing: Text('\$${cartItem.food.price * cartItem.quantity}'),
              );
            },
          );
        },
      ),
    );
  }
}
