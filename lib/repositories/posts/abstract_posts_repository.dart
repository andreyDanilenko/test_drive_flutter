import 'package:test_drive/repositories/posts/models/models.dart';

abstract class AbstractPostsRepository {
  Future<List<Post>> getPostsList();
}
