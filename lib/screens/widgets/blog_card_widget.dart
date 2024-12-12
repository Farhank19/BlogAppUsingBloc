import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/screens/screens.dart';

class BlogCardWidget extends StatelessWidget {
  final String title;
  final String featuredImage;
  final String shortContent;
  final int blogId;

  const BlogCardWidget({
    Key? key,
    required this.title,
    required this.featuredImage,
    required this.shortContent,
    required this.blogId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SingleBlogScreen(blogId: blogId),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(12),
        width: double.infinity, // Takes full width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Optional: rounded corners
          color: Colors.white, // Optional: background color
        ),
        child: Column(
          children: [
            Container(
              height: 0.3.sh, // 70% of screen height
              width: double.infinity,
              child: Image.network(
                featuredImage, // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),

            // Text Content (2 lines)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                shortContent,
                style: TextStyle(fontSize: 12.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),

            // Read More Button (Bold Text)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Read more',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Optional: make the text blue
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
