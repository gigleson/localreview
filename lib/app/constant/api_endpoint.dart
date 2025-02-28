  // class ApiEndpoints {
  //   ApiEndpoints._();

  //   static const Duration connectionTimeout = Duration(seconds: 1000);
  //   static const Duration receiveTimeout = Duration(seconds: 1000);

  //   // For Android Emulator
  //   static const String baseUrl = "http://10.0.2.2:8000/";

  //   // ============= Auth Routes =============
  //   static const String login = "/api/v1/user/login";
  //   static const String register = "/api/v1/user/register";
  //   static const String logout = "/api/v1/user/logout";
  //   static const String getCurrentUser = "/api/v1/user/";
  //   static const String getUserById = "/api/v1/user/:id/profile";
  //   static const String getSuggestedUsers = "/api/v1/user/suggested";
  //   static const String editProfile = "/api/v1/user/profile/edit";
  //   static const String followOrUnfollow = "/api/v1/user/followorunfollow/:id";



  // }

  class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  // **For Android Emulator**
  static const String baseUrl = "http://10.0.2.2:8000";

  // ============= Auth Routes =============
  static const String login = "$baseUrl/api/v1/user/login";
  static const String register = "$baseUrl/api/v1/user/register";
  static const String logout = "$baseUrl/api/v1/user/logout";
  static const String getCurrentUser = "$baseUrl/api/v1/user";
  static const String getSuggestedUsers = "$baseUrl/api/v1/user/suggested";
  static const String editProfile = "$baseUrl/api/v1/user/profile/edit";

  // **Fixed: Use functions to append User ID dynamically**
  static String getUserById(String userId) => "$baseUrl/api/v1/user/$userId/profile";
  static String followOrUnfollow(String userId) => "$baseUrl/api/v1/user/followorunfollow/$userId";
}
