import 'package:equatable/equatable.dart';

import '/models/models.dart';

abstract class BlogDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BlogDetailInitial extends BlogDetailState {}

class BlogDetailLoading extends BlogDetailState {}

class BlogDetailLoaded extends BlogDetailState {
  final BlogDetailModel blog;

  BlogDetailLoaded(this.blog);

  @override
  List<Object?> get props => [blog];
}

class BlogDetailError extends BlogDetailState {
  final String message;

  BlogDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
