import 'package:flutter/material.dart';
import 'package:test_drive/features/posts_screen/widgets/widgets.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('List Screen'),
      ),
      body: ListView.separated(
          itemCount: 40,
          separatorBuilder: (context, index) => (const Divider()),
          itemBuilder: (context, i) {
            const post = 'Post';
            const subpost = 'subpost';
            return PostsListWidget(post: post, subpost: subpost);
          }),
    );
  }
}
