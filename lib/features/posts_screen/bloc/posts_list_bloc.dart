import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/repositories/posts/abstract_posts_repository.dart';
import 'package:test_drive/repositories/posts/models/models.dart';

part 'posts_list_event.dart';
part 'posts_list_state.dart';

class PostsListBloc extends Bloc<PostsListEvent, PostsListState> {
  PostsListBloc(this.postsRepository) : super(PostsListInitial()) {
    on<LoadPostsListEvent>((event, emit) async {
      try {
        final postsList = await postsRepository.getPostsList();
        emit(PostsListLoaded(postsList: postsList));
      } catch (e) {
        emit(PostsListLoadingFailure(exception: e));
      }
    });
  }

  AbstractPostsRepository postsRepository;
}
