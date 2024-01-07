import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/post_model.dart';
import '../service/post_service.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    PostService postService = PostService();
    on<ListPostItems>((event, emit) async {
      emit(const PostLoading(isLoading: true));
      try {
        final List<PostModel> items = await postService.fetchPosts();
        emit(const PostLoading(isLoading: false));
        emit(PostSuccess(postModel: items));
      } catch (error) {
        emit(const PostLoading(isLoading: false));
        emit(PostError(strError: '$error'));
      }
    });
  }
}
