import 'package:equatable/equatable.dart';

abstract class BlogEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchBlogsByCategory extends BlogEvent {
  final int categoryId;

  FetchBlogsByCategory(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}
