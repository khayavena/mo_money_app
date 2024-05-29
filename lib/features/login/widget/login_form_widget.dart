import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mo_money_app/features/login/bloc/get_login_state.dart';
import 'package:mo_money_app/features/login/widget/text_input_widget.dart';

import '../../../shared_components/util/cusmtom_colors.dart';
import '../bloc/get_login_bloc.dart';
import '../bloc/get_login_event.dart';
import 'button.dart';

class LoginFormWidget extends StatefulWidget {
  final GetLoginState state;

  const LoginFormWidget(
      {super.key = const Key("loginFormWidget"), required this.state});

  @override
  State<StatefulWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextInputWidget(
            prefixIcon: "assets/profile/profile_placeholder.svg",
            hint: 'Enter username',
            controller: usernameController,
          ),
          const SizedBox(height: 16),
          TextInputWidget(
            prefixIcon: "assets/login/key_square.svg",
            hint: 'Password',
            controller: passwordController,
            obscure: true,
            suffixIcon: "assets/login/eye_lash.svg",
          ),
          const SizedBox(
            height: 116,
          ),
          Button(
            width: 193,
            height: 63,
            label: 'Login',
            onTap: () {
              if (_formKey.currentState?.validate() == true) {
                context.read<GetLoginBloc>().add(GetLoginEvent(
                    usernameController.text.toString(),
                    passwordController.text.toString()));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 80, left: 36, right: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Mo Money",
              style: TextStyle(
                  fontSize: 34,
                  color: secondaryColorDark,
                  letterSpacing: 0.01,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 30),
            const Text(
              "Welcome to money app",
              style: TextStyle(
                  fontSize: 24,
                  color: secondaryColorDark,
                  letterSpacing: 0.01,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 48),
            _buildForm(),
          ],
        ),
      ),
    );
  }
}
