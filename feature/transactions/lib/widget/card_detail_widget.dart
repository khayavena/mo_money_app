import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardDetailWidget extends StatelessWidget {
  const CardDetailWidget({super.key});

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 16/9,
        child: Container(
          width: 335,
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 220,
          child: SvgPicture.asset(
            "assets/home/card_detail.svg",
            width: double.maxFinite,
          ),
        ),
      );
}
