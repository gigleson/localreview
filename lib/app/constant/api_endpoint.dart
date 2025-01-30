class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  // For Android Emulator
  static const String baseUrl = "http://10.0.2.2:3000/api/v1/";

  // ============= Auth Routes =============
  static const String login = "/api/auth/login";
  static const String register = "/api/auth/register";
  static const String resetPassword = "/api/auth/reset-password";

  // static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  // static const String uploadImage = "auth/uploadImage";


}