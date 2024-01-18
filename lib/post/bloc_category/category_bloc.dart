import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/category_model.dart';
import '../service/category_service.dart';


part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    CategoryService categoryService = CategoryService();
    on<ListCategoryItems>((event, emit) async {
      emit(const CategoryLoading(isLoading: true));
      try {
        final List<CategoryModel> items = await categoryService.fetchCategory();
        emit(const CategoryLoading(isLoading: false));
        emit(CategorySuccess(categoryModel: items));
      } catch (error) {
        emit(const CategoryLoading(isLoading: false));
        emit(CategoryError(strError: '$error'));
      }
    });
  }
}
