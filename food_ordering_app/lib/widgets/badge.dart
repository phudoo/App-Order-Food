// widgets/badge.dart
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget badgeContent;
  final Widget child;

  Badge({required this.badgeContent, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          right: 0,
          top: 0,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 10,
            child: Center(
              child: badgeContent,
            ),
          ),
        ),
      ],
    );
  }
}
