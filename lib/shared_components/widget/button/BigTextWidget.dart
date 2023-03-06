import 'package:flutter/material.dart';

class BigTextWidget extends StatelessWidget {
  final String text;
  final Color color;

  const BigTextWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: 24,
          letterSpacing: 0.01,
          fontWeight: FontWeight.w500),
    );
  }
}
