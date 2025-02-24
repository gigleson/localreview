class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  // For Android Emulator
  static const String baseUrl = "http://10.0.2.2:5000/";

  // ============= Auth Routes =============
  static const String login = "/api/auth/login";
  static const String register = "/api/auth/register";
  static const String resetPassword = "/api/auth/reset-password";
  static const String getUserById = "auth/getUserById/";
  static const String getAllUsers = "auth/getAllUsers/";
  // ============= Profile Routes =============
   static const String createUserProfile = "/api/profile/create-profile";
   static const String uploadImage = "api/profile/uploadImage";


  // static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  // static const String uploadImage = "auth/uploadImage";


}