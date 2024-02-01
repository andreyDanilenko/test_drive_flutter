import 'package:dio/dio.dart';
import 'package:test_drive/repositories/models/post.dart';

class PostsRepository {
  Dio dio = Dio();

  Future<List<Post>> getPostsList() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');

      if (response.statusCode == 200) {
        List<Post> posts =
            List<Post>.from(response.data.map((json) => Post.fromJson(json)));

        return posts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
