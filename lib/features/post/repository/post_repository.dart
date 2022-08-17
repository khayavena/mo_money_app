
import '../model/post.dart';

abstract class UserRepository {

  Future<List<Post>> getPosts();
}
