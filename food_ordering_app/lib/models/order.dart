class Order {
  final int id;
  final double totalPrice;
  final String status;

  Order({required this.id, required this.totalPrice, required this.status});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      totalPrice: json['total_price'].toDouble(),
      status: json['status'],
    );
  }
}
