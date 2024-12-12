import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/repositories/repositories.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryInitial()) {
    on<FetchCategories>((event, emit) async {
      emit(CategoryLoading());
      try {
        final categories = await categoryRepository.fetchCategories();
        emit(CategoryLoaded(categories));
      } catch (e) {
        emit(CategoryError("Failed to load categories"));
      }
    });
  }
}
