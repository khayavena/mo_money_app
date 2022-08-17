import '../model/post.dart';

abstract class RemotePostService {

  Future<List<Post>> getPosts();
}
