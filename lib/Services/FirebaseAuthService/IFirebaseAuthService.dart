import 'package:nimmy_app/BOs/LoginBO/LoginBO.dart';

abstract class IFirebaseAuthService {
  Future<String?> signupUser(LoginBO userData);

  Future<String?> signInUser(LoginBO userData);

  Future<bool?> logoutUser();

  Future<bool?> deleteUser();

  Future<Map<String, String>> getUser();

  Future<bool?> checkEmail(String email);

  Future<bool?> checkUserLoggedIn();
}
