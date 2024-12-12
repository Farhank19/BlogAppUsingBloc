import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/repositories/repositories.dart';
import '/screens/screens.dart';

class BlogListingScreen extends StatelessWidget {
  final String categoryName;
  final int categoryId;

  const BlogListingScreen({
    Key? key,
    required this.categoryName,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => BlogBloc(context.read<BlogRepository>())
          ..add(FetchBlogsByCategory(categoryId)),
        child: BlocBuilder<BlogBloc, BlogState>(
          builder: (context, state) {
            if (state is BlogLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BlogLoaded) {
              return ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) {
                  final blog = state.blogs[index];
                  return BlogCardWidget(
                    title: blog.title,
                    featuredImage: blog.featuredImage,
                    shortContent: blog.shortContent,
                    blogId: blog.id,
                  );
                },
              );
            } else if (state is BlogError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No blogs available'));
            }
          },
        ),
      ),
    );
  }
}
