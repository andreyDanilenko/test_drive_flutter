import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostsListWidget extends StatelessWidget {
  const PostsListWidget({
    super.key,
    required this.post,
    required this.subpost,
  });

  final String post;
  final String subpost;

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
      subtitle: Text(subpost, style: theme.textTheme.bodySmall),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: () {
        Navigator.of(context).pushNamed('/detail-item', arguments: post);
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const ItemScreen()));
      },
    );
  }
}
