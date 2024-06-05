import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/get_profile_bloc.dart';
import '../bloc/get_profile_event.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: SvgPicture.asset(
            "assets/profile/logout_key.svg",
            width: 60,
            height: 60,
          ),
          onTap: () {
            context
                .read<GetProfileBloc>()
                .add(GetUserProfileEvent(isUserLogout: true));
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("Logout")
      ],
    );
  }
}
