// widgets/review_list.dart
import 'package:flutter/material.dart';
import '../models/review.dart';

class ReviewList extends StatelessWidget {
  final List<Review> reviews;

  const ReviewList({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return ListTile(
          title: Text(review.user.name),
          subtitle: Text(review.comment),
          trailing: Text(review.rating.toString()),
        );
      },
    );
  }
}