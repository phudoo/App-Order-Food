// screens/order_history_screen.dart
import 'package:flutter/material.dart';
import '../services/order_service.dart';
import '../models/order.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final OrderService _orderService = OrderService();
  late Future<List<Order>> _orders;

  @override
  void initState() {
    super.initState();
    _orders = _orderService.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order History')),
      body: FutureBuilder<List<Order>>(
        future: _orders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders available'));
          } else {
            return ListView(
              children: snapshot.data!.map((order) => ListTile(
                title: Text('Order #${order.id}'),
                subtitle: Text('Total: \$${order.totalPrice}'),
                trailing: Text(order.status),
              )).toList(),
            );
          }
        },
      ),
    );
  }
}
