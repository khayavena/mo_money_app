import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../comon/result_status.dart';
import '../bloc/get_login_bloc.dart';
import '../bloc/get_login_state.dart';
import '../constants/login_analytics_events.dart';
import '../widget/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  final Function(bool loggedIn) onLoginState;

  const LoginPage({
    Key? key,
    required this.onLoginState,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocConsumer<GetLoginBloc, GetLoginState>(listener: (context, state) {
        switch (state.status) {
          case ResultStatus.init:
            log(LoginAnalyticsEvents.loginInitEvent);
            break;
          case ResultStatus.done:
            widget.onLoginState(state.isLoggedIn);
            log("${LoginAnalyticsEvents.loginDoneEvent}logged in:${state.isLoggedIn}");
            break;
          case ResultStatus.failed:
            widget.onLoginState(state.isLoggedIn);
            log(LoginAnalyticsEvents.loginFailedEvent);
            break;
        }
      }, builder: (context, state) {
        return LoginFormWidget(state: state);
      }),
    );
  }
}
