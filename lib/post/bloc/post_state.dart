part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {
  final bool isLoading;

  const PostLoading({
    required this.isLoading,
  });
  @override
  List<Object> get props => [isLoading];
}

final class PostError extends PostState {
  final String strError;
  const PostError({
    required this.strError,
  });

  @override
  List<Object> get props => [strError];
}

final class PostSuccess extends PostState {
  final List<PostModel> postModel;
  const PostSuccess({
    required this.postModel,
  });
  @override
  List<Object> get props => [postModel];
}
