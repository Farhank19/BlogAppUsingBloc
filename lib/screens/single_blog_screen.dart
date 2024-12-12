import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '/blocs/blocs.dart';
import '/repositories/repositories.dart';

class SingleBlogScreen extends StatelessWidget {
  final int blogId;

  const SingleBlogScreen({Key? key, required this.blogId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Detail'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => BlogDetailBloc(context.read<BlogRepository>())
          ..add(FetchBlogDetail(blogId)),
        child: BlocBuilder<BlogDetailBloc, BlogDetailState>(
          builder: (context, state) {
            if (state is BlogDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BlogDetailLoaded) {
              final blog = state.blog;
              return Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(blog.featuredImageUrl,
                          fit: BoxFit.cover, width: double.infinity),
                      SizedBox(
                        height: 15.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(blog.title,
                              style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(height: 8),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww'),
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text("By ${blog.authorName}",
                                  style: TextStyle(fontSize: 16.sp)),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text("|",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text("${blog.createdDate}",
                                  style: TextStyle(fontSize: 16.sp)),
                            ],
                          ),
                          Divider(),
                          const SizedBox(height: 16),
                          HtmlWidget(
                            blog.content,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is BlogDetailError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Unable to load blog details.'));
            }
          },
        ),
      ),
    );
  }
}
