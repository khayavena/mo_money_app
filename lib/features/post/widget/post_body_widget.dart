import 'package:business_banking_app/features/post/widget/posts_list_view_widget.dart';
import 'package:flutter/material.dart';

import '../../../shared_components/widget/loader/app_loading_widget.dart';
import '../../../shared_components/widget/screen/failure_widget.dart';
import '../bloc/get_posts_state.dart';
import '../bloc/result_status.dart';

class PostBodyWidget extends StatelessWidget {
  final GetPostsState state;

  const PostBodyWidget(
      {Key? key = const Key('postBodyWidget'), required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case ResultStatus.init:
        return const AppLoadingWidget();
      case ResultStatus.done:
        return PostsListViewWidget(posts: state.posts);
      default:
        return const FailureWidget();
    }
  }
}
