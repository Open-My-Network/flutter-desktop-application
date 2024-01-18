part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {
  final bool isLoading;

  const CategoryLoading({
    required this.isLoading,
  });
  @override
  List<Object> get props => [isLoading];
}

final class CategoryError extends CategoryState {
  final String strError;
  const CategoryError({
    required this.strError,
  });

  @override
  List<Object> get props => [strError];
}

final class CategorySuccess extends CategoryState {
  final List<CategoryModel> categoryModel;
  const CategorySuccess({
    required this.categoryModel,
  });
  @override
  List<Object> get props => [categoryModel];
}
