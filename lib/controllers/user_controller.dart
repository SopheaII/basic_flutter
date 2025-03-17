import 'package:app_test/models/user_model.dart';
import 'package:app_test/services/api_service.dart';

class UserController {
  final ApiService _apiService = ApiService();

  Future<User?> login(String username, String password) async {
    // Directly return the User object from the API service
    return await _apiService.login(username, password);
  }

  Future<bool> register(String email, String profileImageUrl, String username, String password) async {
    final user = User(
      email: email,
      profileImageUrl: profileImageUrl,
      userName: username,
      password: password, // Include password
    );
    return await _apiService.register(user);
  }
}
