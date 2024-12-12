import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/repositories/repositories.dart';

class BlogDetailBloc extends Bloc<BlogDetailEvent, BlogDetailState> {
  final BlogRepository blogRepository;

  BlogDetailBloc(this.blogRepository) : super(BlogDetailInitial()) {
    on<FetchBlogDetail>((event, emit) async {
      emit(BlogDetailLoading());
      try {
        final blog = await blogRepository.fetchBlogDetail(event.blogId);
        emit(BlogDetailLoaded(blog));
      } catch (e) {
        emit(BlogDetailError("Failed to load blog details"));
      }
    });
  }
}
