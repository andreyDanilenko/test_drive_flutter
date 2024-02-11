part of 'posts_list_bloc.dart';

abstract class PostsListState extends Equatable {}

class PostsListInitial extends PostsListState {
  @override
  List<Object?> get props => [];
}

class PostsListLoading extends PostsListState {
  @override
  List<Object?> get props => [];
}

class PostsListLoaded extends PostsListState {
  PostsListLoaded({required this.postsList});

  final List<Post> postsList;

  @override
  List<Object?> get props => [postsList];
}

class PostsListLoadingFailure extends PostsListState {
  PostsListLoadingFailure({this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
