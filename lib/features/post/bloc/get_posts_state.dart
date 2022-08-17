import 'package:bidvest_business_banking_app/features/post/bloc/result_status.dart';

import '../model/post.dart';

class GetPostsState {
  ResultStatus status;
  List<Post> posts = [];

  GetPostsState({this.status = ResultStatus.init, this.posts = const []});

  GetPostsState updateWith(
      {required ResultStatus state, required List<Post> results}) {
    return GetPostsState(status: state, posts: results);
  }
}
