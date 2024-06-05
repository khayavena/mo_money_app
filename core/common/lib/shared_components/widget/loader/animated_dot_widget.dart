import 'dart:math';

import 'package:flutter/material.dart';

import 'dot_type.dart';

class AnimatedDotWidget extends StatelessWidget {
  final double radius;
  final Color color;
  final DotType type;
  final Icon icon;

  const AnimatedDotWidget(
      {super.key,
      required this.radius,
      required this.color,
      required this.type,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: type == DotType.icon ? _buildIcon() : _buildAnimatedDot(),
    );
  }

  Widget _buildIcon() {
    return Icon(
      icon.icon,
      color: color,
      size: 1.3 * radius,
    );
  }

  Widget _buildAnimatedDot() {
    return Transform.rotate(
      angle: type == DotType.diamond ? pi / 4 : 0.0,
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: _buildShape()),
      ),
    );
  }

  BoxShape _buildShape() {
    return type == DotType.circle ? BoxShape.circle : BoxShape.rectangle;
  }
}
