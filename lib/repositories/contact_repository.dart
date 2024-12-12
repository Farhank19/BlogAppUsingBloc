import '/services/services.dart';

class ContactRepository {
  final ApiService _apiService = ApiService();

  Future<String> submitContactForm({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final response = await _apiService.post(
      ApiEndpoints.contactForm,
      {
        "input_1": name,
        "input_3": email,
        "input_4": subject,
        "input_5": message,
      },
    );

    if (response['is_valid'] == true) {
      return response['confirmation_message'];
    } else {
      throw Exception('Form submission failed');
    }
  }
}
