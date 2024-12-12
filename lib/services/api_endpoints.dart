class ApiEndpoints {
  static const String baseUrl = "https://citizen-femme.com/wp-json";

  // Auth
  static const String login = "$baseUrl/custom/v1/login";

  // Posts
  static const String categories = "$baseUrl/custom/v1/categories";
  static const String posts = "$baseUrl/custom/v1/posts";
  static String singlePost(int id) => "$baseUrl/custom/v1/post/$id";

  // Contact Form
  static const String contactForm = "$baseUrl/gf/v2/forms/1/submissions";
}
