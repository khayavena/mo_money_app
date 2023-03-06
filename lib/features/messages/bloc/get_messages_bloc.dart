import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_money_app/features/comon/result_status.dart';

import '../repository/message_repository.dart';
import 'get_messages_event.dart';
import 'get_messages_state.dart';

class GetMessagesBloc extends Bloc<GetMessagesEvent, GetMessagesState> {
  final MessageRepository repository;

  GetMessagesBloc({required this.repository}) : super(GetMessagesState()) {
    on<GetMessagesEvent>((event, emit) async {
      emit(await _getMessagesToState(event));
    });
  }

  Future<GetMessagesState> _getMessagesFailureToState() async {
    return state.updateWith(state: ResultStatus.failed, results: []);
  }

  Future<GetMessagesState> _getMessagesToState(GetMessagesEvent event) async {
    final results = await repository.getMessages();
    if (results.isEmpty) {
      return _getMessagesFailureToState();
    }
    return state.updateWith(state: ResultStatus.done, results: results);
  }
}
