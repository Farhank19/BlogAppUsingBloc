import '/models/models.dart';
import '/services/services.dart';

class BlogRepository {
  final ApiService _apiService = ApiService();

  Future<List<BlogModel>> fetchBlogsByCategory(int categoryId) async {
    final response =
        await _apiService.get('${ApiEndpoints.posts}?category_id=$categoryId');
    return (response as List).map((e) => BlogModel.fromJson(e)).toList();
  }

  // Fetch a single blog by ID
  Future<BlogDetailModel> fetchBlogDetail(int blogId) async {
    final response = await _apiService.get(ApiEndpoints.singlePost(blogId));
    return BlogDetailModel.fromJson(response);
  }
}
