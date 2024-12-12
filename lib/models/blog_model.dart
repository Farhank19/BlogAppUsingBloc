class BlogModel {
  final int id;
  final String title;
  final String featuredImage;
  final String shortContent;

  BlogModel({
    required this.id,
    required this.title,
    required this.featuredImage,
    required this.shortContent,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      title: json['title'],
      featuredImage: json['featured_image'],
      shortContent: json['short_content'],
    );
  }
}
