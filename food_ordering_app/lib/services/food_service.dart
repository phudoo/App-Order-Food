// services/food_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/food.dart';

class FoodService {
  final String baseUrl = 'http://localhost:8000/api/auth';

  Future<List<Food>> fetchFoods() async {
    final response = await http.get(Uri.parse('$baseUrl/foods'));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print(responseData); // In ra để kiểm tra

      // Kiểm tra xem dữ liệu có phải là List hay Map và xử lý theo đó
      if (responseData is List) {
        return responseData.map((json) => Food.fromJson(json)).toList();
      } else if (responseData is Map && responseData.containsKey('data')) {
        // Trường hợp API trả về Map chứa trường 'data'
        List<dynamic> data = responseData['data'];
        return data.map((json) => Food.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to fetch foods');
    }
  }
}
