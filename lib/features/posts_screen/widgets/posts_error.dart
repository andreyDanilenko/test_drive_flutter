import 'package:flutter/material.dart';
import 'package:test_drive/features/posts_screen/bloc/posts_list_bloc.dart';

class PostsErrorWidget extends StatelessWidget {
  const PostsErrorWidget({
    super.key,
    required PostsListBloc postsListBloc,
  }) : _postsListBloc = postsListBloc;

  final PostsListBloc _postsListBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Something went wrong',
          style: theme.textTheme.bodyMedium,
        ),
        Text(
          'Please try again later',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: () {
            _postsListBloc.add(LoadPostsListEvent());
          },
          child: Text(
            'Try again',
            style: theme.textTheme.bodySmall,
          ),
        )
      ],
    ));
  }
}
