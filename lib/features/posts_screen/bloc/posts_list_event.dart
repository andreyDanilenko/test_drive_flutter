part of 'posts_list_bloc.dart';

abstract class PostsListEvent extends Equatable {}

class LoadPostsListEvent extends PostsListEvent {
  final Completer? completer;

  LoadPostsListEvent({this.completer});

  @override
  List<Object?> get props => [completer];
}
