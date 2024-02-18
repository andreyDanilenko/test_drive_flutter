import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_drive/features/posts_screen/bloc/posts_list_bloc.dart';
import 'package:test_drive/features/posts_screen/widgets/widgets.dart';
import 'package:test_drive/repositories/posts/posts.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final _postsListBloc = PostsListBloc(GetIt.I<AbstractPostsRepository>());

  @override
  void initState() {
    _postsListBloc.add(LoadPostsListEvent());
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
        body: RefreshIndicator(
            onRefresh: () async {
              final completer = Completer();
              _postsListBloc.add(LoadPostsListEvent(completer: completer));
              return completer.future;
            },
            child: BlocBuilder<PostsListBloc, PostsListState>(
                bloc: _postsListBloc,
                builder: (context, state) {
                  if (state is PostsListLoaded) {
                    return ListView.separated(
                        itemCount: state.postsList.length,
                        separatorBuilder: (context, index) => (const Divider()),
                        itemBuilder: (context, i) {
                          final post = state.postsList[i].title;
                          const subPost = 'more details';
                          return PostsListWidget(post: post, subPost: subPost);
                        });
                  }
                  if (state is PostsListLoadingFailure) {
                    return PostsErrorWidget(postsListBloc: _postsListBloc);
                  }
                  return const Center(child: CircularProgressIndicator());
                })));
  }
}

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
