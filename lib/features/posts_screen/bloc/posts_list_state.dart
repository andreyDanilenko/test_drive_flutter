part of 'posts_list_bloc.dart';

class PostsListState {}

class PostsListInitial extends PostsListState {}

class PostsListLoading extends PostsListState {}

class PostsListLoaded extends PostsListState {
  PostsListLoaded({required this.postsList});

  final List<Post> postsList;
}

class PostsListLoadingFailure extends PostsListState {
  PostsListLoadingFailure({this.exception});

  final Object? exception;
}
