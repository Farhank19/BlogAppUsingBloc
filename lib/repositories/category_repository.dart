import '/models/models.dart';
import '/services/services.dart';

class CategoryRepository {
  final ApiService _apiService = ApiService();

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await _apiService.get(ApiEndpoints.categories);
    return (response as List).map((e) => CategoryModel.fromJson(e)).toList();
  }
}
