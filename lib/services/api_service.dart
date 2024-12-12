import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> get(String url,
      {Map<String, String>? queryParameters}) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
