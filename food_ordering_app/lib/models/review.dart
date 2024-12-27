class Review {
  final int id;
  final int foodId;
  final int userId;
  final String comment;
  final double rating;

  Review({required this.id, required this.foodId, required this.userId, required this.comment, required this.rating});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      foodId: json['food_id'],
      userId: json['user_id'],
      comment: json['comment'],
      rating: json['rating'].toDouble(),
    );
  }

  get user => null;
}
