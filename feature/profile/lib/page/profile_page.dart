import 'package:auto_route/auto_route.dart';
import 'package:common/result_status.dart';
import 'package:common/shared_components/util/cusmtom_colors.dart';
import 'package:common/shared_components/widget/button/back_button_widget.dart';
import 'package:common/shared_components/widget/loader/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main/router.gr.dart';
import '../bloc/get_profile_bloc.dart';
import '../bloc/get_profile_event.dart';
import '../bloc/get_profile_state.dart';
import '../widget/profile_logout_widget.dart';
import '../widget/profile_widget_widget.dart';
@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<GetProfileBloc>().add(GetUserProfileEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButtonWidget(),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: BlocConsumer<GetProfileBloc, GetProfileState>(
            listener: (context, state) async {
          if (state.isLogout) {
            await AutoRouter.of(context).popAndPush(const HomePage());
          }
        }, builder: (context, state) {
          if (state.status == ResultStatus.init) {
            return const AppLoadingWidget();
          } else {
            return _buildProfileWidget(state.user?.username ?? "");
          }
        }));
  }

  Widget _buildProfileWidget(final String user) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Profile",
            style: TextStyle(
                color: secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.01),
          ),
          const SizedBox(
            height: 35,
          ),
          const ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              user,
              style: const TextStyle(
                color: secondaryColor,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 111),
          const LogoutWidget()
        ],
      ),
    );
  }
}
