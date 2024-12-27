class Food {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;  // This is where the image URL is stored

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,  // Initialize image
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: _parsePrice(json['price']),
      image: json['image'],  // Ensure you use 'image' here
    );
  }

  static double _parsePrice(dynamic price) {
    if (price is String) {
      return double.tryParse(price) ?? 0.0;
    }
    if (price is num) {
      return price.toDouble();
    }
    return 0.0;
  }

  get reviews => null;
}
