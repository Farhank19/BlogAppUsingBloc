import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/repositories/repositories.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository blogRepository;

  BlogBloc(this.blogRepository) : super(BlogInitial()) {
    on<FetchBlogsByCategory>((event, emit) async {
      emit(BlogLoading());
      try {
        final blogs =
            await blogRepository.fetchBlogsByCategory(event.categoryId);
        emit(BlogLoaded(blogs));
      } catch (e) {
        emit(BlogError("Failed to load blogs"));
      }
    });
  }
}
