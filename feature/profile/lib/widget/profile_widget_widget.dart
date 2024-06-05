import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Image.asset(
          "assets/profile/profile_picture.png",
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
