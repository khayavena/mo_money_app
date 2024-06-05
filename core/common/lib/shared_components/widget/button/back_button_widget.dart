import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: SvgPicture.asset(
          "assets/shared/back_button.svg",
          width: 44,
          height: 44,
        ),
        onTap: () {
          AutoRouter.of(context).pop();
        },
      ),
    );
  }
}
