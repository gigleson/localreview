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
  // static const String baseUrl = "http://10.0.2.2:8000";
  static const String baseUrl ="http://192.168.1.72:8000";

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

    // ============= Post Routes =============
  static const String addPost = "$baseUrl/api/v1/post/addpost";
  static const String getAllPosts = "$baseUrl/api/v1/post/all";
  static const String getUserPosts = "$baseUrl/api/v1/post/userpost/all";
  static const String likePost = "$baseUrl/api/v1/post/:id/like";
  static const String dislikePost = "$baseUrl/api/v1/post/:id/dislike";
  static const String addComment = "$baseUrl/api/v1/post/:id/comment";
  static const String getComments = "$baseUrl/api/v1/post/:id/comment/all";
  static const String deletePost = "$baseUrl/api/v1/post/delete/:id";
  static const String bookmarkPost = "$baseUrl/api/v1/post/:id/bookmark";


  //chat
  static const String sendmesage = "$baseUrl/api/v1/message/send/:id";
  static const String getmesage = "$baseUrl/api/char/message/:id";
 

}
