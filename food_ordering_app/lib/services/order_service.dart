// services/order_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/order.dart';

class OrderService {
  final String baseUrl = 'http://localhost:8000/api';

  Future<List<Order>> fetchOrders() async {
    final response = await http.get(
      Uri.parse('$baseUrl/orders'), // Đường dẫn API orders
      headers: {'Authorization': 'Bearer YOUR_TOKEN_HERE'}, // Thêm token nếu cần
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch orders');
    }
  }

  Future<List<Order>> fetchOrderHistory() async {
    final response = await http.get(
      Uri.parse('$baseUrl/orders/history'), // Đường dẫn API lịch sử đơn hàng
      headers: {'Authorization': 'Bearer YOUR_TOKEN_HERE'}, // Thêm token nếu cần
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch order history');
    }
  }
}
