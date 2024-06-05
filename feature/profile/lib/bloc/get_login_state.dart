

import 'package:common/result_status.dart';
import 'package:model/login/user.dart';

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
