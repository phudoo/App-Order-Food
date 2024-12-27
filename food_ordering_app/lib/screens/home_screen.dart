import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/food.dart';
import 'package:food_ordering_app/screens/food_detail_screen.dart';
import 'package:food_ordering_app/services/food_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FoodService _foodService = FoodService();
  late Future<List<Food>> _foods;

  @override
  void initState() {
    super.initState();
    _foods = _foodService.fetchFoods(); // Gọi API để lấy danh sách món ăn
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.white)),
        backgroundColor: Colors.teal, // Stylish background color
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, size: 30),
            onPressed: () {
              // Navigate to Account Screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0, vertical: 20.0), // Consistent padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tìm kiếm món ăn
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: _buildSearchBar(),
            ),

            // Tiêu đề "Categories"
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),

            // Các danh mục món ăn
            _buildCategoryList(),

            // Tiêu đề "Popular Dishes"
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Popular Dishes',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),

            // Món ăn nổi bật từ API
            Expanded(
              child: FutureBuilder<List<Food>>(
                future: _foods,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error: ${snapshot.error}',
                            style: TextStyle(color: Colors.red)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                        child: Text('No foods available',
                            style: TextStyle(color: Colors.grey)));
                  } else {
                    return _buildFoodList(snapshot.data!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tìm kiếm món ăn với styling đẹp hơn
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blueGrey[50],
        prefixIcon: Icon(Icons.search, color: Colors.teal),
        hintText: 'Search for foods...',
        hintStyle: TextStyle(color: Colors.blueGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      onChanged: (query) {
        // Implement search functionality here
      },
    );
  }

  // Danh mục món ăn
  Widget _buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryCard('Pizza', Icons.local_pizza),
          _buildCategoryCard('Burgers', Icons.fastfood),
          _buildCategoryCard('Salads', Icons.restaurant_menu),
          _buildCategoryCard('Drinks', Icons.local_drink),
        ],
      ),
    );
  }

  // Card thể loại món ăn
  Widget _buildCategoryCard(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Handle category selection here
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 120,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.teal.shade200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(2, 4), blurRadius: 6)
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // List food item
  Widget _buildFoodList(List<Food> foods) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        Food food = foods[index];
        return _buildFoodCard(food);
      },
    );
  }

  // Card món ăn nổi bật
  // Card món ăn nổi bật
  Widget _buildFoodCard(Food food) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            food.image, // Use 'food.image' for the image URL
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        title: Text(
          food.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          food.description,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        trailing: Text(
          '\$${food.price.toString()}',
          style: TextStyle(
              fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Navigate to the detail page and pass the selected food
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailScreen(
                  food: food), // Pass the selected food to FoodDetailScreen
            ),
          );
        },
      ),
    );
  }
}
