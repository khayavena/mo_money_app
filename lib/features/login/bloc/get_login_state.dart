import 'package:mo_money_app/features/comon/result_status.dart';

import '../model/user.dart';

class GetLoginState {
  ResultStatus status;
  User? user;
  bool isLoggedIn;

  GetLoginState(
      {this.status = ResultStatus.init, this.user, this.isLoggedIn = false});

  GetLoginState updateWith(
      {required ResultStatus state,
      required User? results,
      required bool isLoggedIn}) {
    return GetLoginState(status: state, user: results, isLoggedIn: isLoggedIn);
  }
}
