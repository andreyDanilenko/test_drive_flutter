import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostsListWidget extends StatelessWidget {
  const PostsListWidget({
    super.key,
    required this.post,
    required this.subPost,
  });

  final String post;
  final String subPost;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      key: Key('$key'),
      leading: SvgPicture.asset(
        'assets/images/svg/grooming_fish.svg',
        height: 25,
        width: 25,
      ),
      title: Text(post, style: theme.textTheme.bodyMedium),
      subtitle: Text(subPost, style: theme.textTheme.bodySmall),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: () {
        Navigator.of(context).pushNamed('/detail-post', arguments: post);
      },
    );
  }
}
