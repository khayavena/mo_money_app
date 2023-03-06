import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mo_money_app/features/main/router.gr.dart';
import 'package:mo_money_app/shared_components/util/cusmtom_colors.dart';

class HomeNavigationWidget extends StatelessWidget {
  const HomeNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: buildProfileAction(),
            onTap: () async {
              AutoRouter.of(context).push(const ProfileRoute());
            },
          ),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            child: buildNotificationAction(),
            onTap: () async {
              AutoRouter.of(context).push(MessageListRoute(title: "Messages"));
            },
          )
        ]);
  }

  Widget buildProfileAction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIcon("assets/profile/profile_placeholder.svg"),
        const SizedBox(
          height: 10,
        ),
        const Text("Profile",
            style: TextStyle(fontSize: 13, color: tertiaryColorDarker))
      ],
    );
  }

  Widget buildIcon(String icon) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: const [
          BoxShadow(
            color: dropShadow,
            offset: Offset(20.0, 20.0),
            blurRadius: 20.0,
          )
        ],
      ),
      width: 48,
      height: 48,
      child: Stack(
        children: [
          Center(
            child: SvgPicture.asset("assets/home/nav_action_background.svg",
                width: 48, height: 48, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),
          Center(
              child: SvgPicture.asset(icon,
                  width: 16, height: 16, fit: BoxFit.cover))
        ],
      ),
    );
  }

  Widget buildNotificationAction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildIcon("assets/messages/notification.svg"),
        const SizedBox(
          height: 10,
        ),
        const Text("Inbox",
            style: TextStyle(fontSize: 13, color: tertiaryColorDarker))
      ],
    );
  }
}
