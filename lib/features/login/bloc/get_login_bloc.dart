import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mo_money_app/features/comon/result_status.dart';

import '../model/user.dart';
import '../repository/login_repository.dart';
import 'get_login_event.dart';
import 'get_login_state.dart';

@Injectable()
class GetLoginBloc extends Bloc<GetLoginEvent, GetLoginState> {
  LoginRepository repository;

  GetLoginBloc({required this.repository}) : super(GetLoginState()) {
    on<GetLoginEvent>((event, emit) async {
      emit(await _getLoginToState(event));
    });
  }

  Future<GetLoginState> _getLoginToState(GetLoginEvent event) async {
    final results = await repository.getCurrentUser();
    if (results != null) {
      return state.updateWith(
          state: ResultStatus.done, results: results, isLoggedIn: true);
    } else {
      if (event.username.isNotEmpty && event.password.isNotEmpty) {
        final user =
            User().copyWith(username: event.username, password: event.password);
        final isRegistered = await repository.registerUser(user);
        if (isRegistered) {
          return state.updateWith(
              state: ResultStatus.done,
              results: results,
              isLoggedIn: isRegistered);
        }
      }
    }
    return state.updateWith(
        state: ResultStatus.failed, results: null, isLoggedIn: false);
  }
}
