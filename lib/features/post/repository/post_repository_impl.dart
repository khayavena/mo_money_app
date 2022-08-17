import 'package:bidvest_business_banking_app/features/post/repository/post_repository.dart';

import '../../../http_delegate/http_delegate_exception.dart';
import '../../../http_delegate/http_delegate_general_exception.dart';
import '../model/post.dart';
import '../remote_data/remote_post_service.dart';

///Logic for specific data source to be performed here remote or local'
class UserRepositoryImpl implements UserRepository {
  final RemotePostService _postService;

  ///Ready to call endPoints no need to worry about -
  /// Dio and Json(FromJson to json) lib at this moment  delegate does that for you
  UserRepositoryImpl({required RemotePostService postService})
      : _postService = postService;

  @override
  Future<List<Post>> getPosts() async {
    try {
      final posts = _postService.getPosts();
      return posts;
    } on HttpDelegateGeneralException catch (e) {
      return [];
    } on HttpDelegateException catch (e) {
      return [];
    }
  }
}
