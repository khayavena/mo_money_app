import 'package:flutter/material.dart';

import '../model/post.dart';

class PostsListViewWidget extends StatelessWidget {
  final List<Post> posts;

  const PostsListViewWidget(
      {Key key = const Key('postsPage'), required this.posts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: const Icon(Icons.list),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: Text(posts[index].title));
        });
  }
}
