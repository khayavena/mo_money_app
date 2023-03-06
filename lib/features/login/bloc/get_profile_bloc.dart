import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_money_app/features/comon/result_status.dart';

import '../repository/login_repository.dart';
import 'get_profile_event.dart';
import 'get_profile_state.dart';

class GetProfileBloc extends Bloc<GetProfileEvent, GetProfileState> {
  final LoginRepository repository;

  GetProfileBloc({required this.repository}) : super(GetProfileState()) {
    on<GetUserProfileEvent>((event, emit) async {
      emit(await _getUserInfoToState(event));
    });
  }

  Future<GetProfileState> _getUserInfoToState(GetUserProfileEvent event) async {
    if (event.isUserLogout) {
      return _getLogoutUserToState(event);
    }
    final results = await repository.getCurrentUser();
    if (results != null) {
      return state.updateWith(
          state: ResultStatus.done, results: results, isLogout: false);
    }
    return state.updateWith(
        state: ResultStatus.failed, results: null, isLogout: false);
  }

  Future<GetProfileState> _getLogoutUserToState(
      GetUserProfileEvent event) async {
    final results = await repository.logout();
    final results2 = await repository.getCurrentUser();
    if (results2 == null) {
      return state.updateWith(
          state: ResultStatus.done, results: null, isLogout: true);
    }
    return state.updateWith(
        state: ResultStatus.failed, results: null, isLogout: false);
  }
}
