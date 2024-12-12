class BlogDetailModel {
  final int id;
  final String title;
  final String content;
  final String authorName;
  final String createdDate;
  final String featuredImageUrl;

  BlogDetailModel({
    required this.id,
    required this.title,
    required this.content,
    required this.authorName,
    required this.createdDate,
    required this.featuredImageUrl,
  });

  factory BlogDetailModel.fromJson(Map<String, dynamic> json) {
    return BlogDetailModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      authorName: json['author_name'],
      createdDate: json['created_date'],
      featuredImageUrl: json['featured_image_url'],
    );
  }
}
