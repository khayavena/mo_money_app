import 'package:business_banking_app/features/post/bloc/get_posts_event.dart';
import 'package:business_banking_app/features/post/bloc/get_posts_state.dart';
import 'package:business_banking_app/features/post/bloc/result_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/post_repository.dart';

///Preferable each bloc should focus on single functionality to avoid multiple states
/// in different widgets being updated unnecessarily and also avoid conditional
/// operations on which state to update. Having single responsibility also makes
/// your block clean and simple.

class GetPostsBloc extends Bloc<GetPostsEvent, GetPostsState> {
  final UserRepository repository;

  GetPostsBloc({required this.repository}) : super(GetPostsState()) {
    on<GetPostsEvent>((event, emit) async {
      emit(await _getUsersToState(event));
    });
  }

  Future<GetPostsState> _getUsersFailureToState() async {
    return state.updateWith(state: ResultStatus.failed, results: []);
  }

  Future<GetPostsState> _getUsersToState(GetPostsEvent event) async {
    final results = await repository.getPosts();
    if (results.isEmpty) {
      return _getUsersFailureToState();
    }
    return state.updateWith(state: ResultStatus.done, results: results);
  }
}
