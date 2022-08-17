import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/get_posts_bloc.dart';
import '../bloc/get_posts_event.dart';
import '../bloc/get_posts_state.dart';
import '../bloc/result_status.dart';
import '../constants/post_analytics_events.dart';
import '../widget/post_body_widget.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<GetPostsBloc>().add(GetPostsEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: BlocConsumer<GetPostsBloc, GetPostsState>(
            listener: (context, state) {
          switch (state.status) {
            case ResultStatus.init:
              log(PostAnalyticsEvents.postsInitEvent);
              break;
            case ResultStatus.done:
              log(PostAnalyticsEvents.postsDoneEvent);
              break;
            case ResultStatus.failed:
              log(PostAnalyticsEvents.postsFailedEvent);
              break;
          }
        }, builder: (context, state) {
          return PostBodyWidget(state: state);
        }),
      ),
    );
  }
}
