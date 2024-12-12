import 'package:equatable/equatable.dart';

abstract class BlogDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchBlogDetail extends BlogDetailEvent {
  final int blogId;

  FetchBlogDetail(this.blogId);

  @override
  List<Object?> get props => [blogId];
}
