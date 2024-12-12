import 'package:shared_preferences/shared_preferences.dart';

import '/services/services.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();

  Future<bool> login(String username, String password) async {
    final body = {"username": username, "password": password};
    final response = await _apiService.post(ApiEndpoints.login, body);
    if (response['status'] == 'success') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response['token']);
      return true;
    }
    return false;
  }
}
