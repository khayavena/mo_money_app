

import 'package:common/result_status.dart';
import 'package:model/login/user.dart';

class GetProfileState {
  ResultStatus status;
  User? user;
  bool isLogout;

  GetProfileState(
      {this.status = ResultStatus.init, this.user, this.isLogout = false});

  GetProfileState updateWith(
      {required ResultStatus state,
      required User? results,
      required bool isLogout}) {
    return GetProfileState(status: state, user: results, isLogout: isLogout);
  }
}
