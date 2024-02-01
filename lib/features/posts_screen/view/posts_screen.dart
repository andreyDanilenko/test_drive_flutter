import 'package:flutter/material.dart';
import 'package:test_drive/features/posts_screen/widgets/widgets.dart';
import 'package:test_drive/repositories/models/post.dart';
import 'package:test_drive/repositories/posts/posts_repository.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Post>? _postsList;

  @override
  void initState() {
    _getPostsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('List Screen'),
      ),
      body: _postsList == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: _postsList!.length,
              separatorBuilder: (context, index) => (const Divider()),
              itemBuilder: (context, i) {
                final post = _postsList![i].title;
                const subPost = 'subpost';
                return PostsListWidget(post: post, subPost: subPost);
              }),
    );
  }

  void _getPostsList() async {
    _postsList = await PostsRepository().getPostsList();
    setState(() {});
  }
}
