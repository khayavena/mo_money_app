import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:common/result_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/get_login_bloc.dart';
import '../bloc/get_login_state.dart';
import '../constants/login_analytics_events.dart';
import '../widget/login_form_widget.dart';
@RoutePage()
class LoginPage extends StatefulWidget {
  final Function(bool loggedIn) onLoginState;

  const LoginPage({
    super.key,
    required this.onLoginState,
  });

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
