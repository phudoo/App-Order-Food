// services/auth_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String baseUrl = 'http://localhost:8000/api'; // Base URL cho API

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'), // Sử dụng đúng đường dẫn
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'), // Sử dụng đúng đường dẫn
      body: {'name': name, 'email': email, 'password': password},
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<Map<String, dynamic>> getProfile() async {
    final response = await http.get(
      Uri.parse('$baseUrl/auth/user'), // Lấy thông tin người dùng
      headers: {'Authorization': 'Bearer YOUR_TOKEN_HERE'}, // Thêm token nếu cần
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch profile');
    }
  }

  Future<void> updateProfile(String name, String email) async {
    final response = await http.put(
      Uri.parse('$baseUrl/auth/user'), // Cập nhật thông tin người dùng
      body: {'name': name, 'email': email},
      headers: {'Authorization': 'Bearer YOUR_TOKEN_HERE'}, // Thêm token nếu cần
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update profile');
    }
  }

  Future<void> logout() async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/logout'), // Đăng xuất
      headers: {'Authorization': 'Bearer YOUR_TOKEN_HERE'}, // Thêm token nếu cần
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to logout');
    }
  }
}
