import 'package:business_banking_app/features/post/model/post.dart';
import 'package:business_banking_app/features/post/remote_data/remote_post_service.dart';

import '../../../http_delegate/http_req_delegate.dart';

class RemoteUserServiceImpl implements RemotePostService {
  ///Public for unit testing
  final HttpReqDelegate reqDelegate;

  ///Ready to call endPoints no need to worry about -
  /// Dio and Json(FromJson to json) lib at this moment  delegate does that for you
  RemoteUserServiceImpl({required this.reqDelegate});

  @override
  Future<List<Post>> getPosts() async {
    final posts = reqDelegate.getList<Post>('/posts', Post());
    return posts;
  }
}
