import 'package:common/shared_components/util/cusmtom_colors.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  final Function? onTap;
  final String label;
  final double width;
  final double height;

  const Button(
      {super.key,
      this.onTap,
      required this.label,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Container(
        width: 193,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: secondaryColor,
          boxShadow: [
            BoxShadow(
              color: secondaryColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
