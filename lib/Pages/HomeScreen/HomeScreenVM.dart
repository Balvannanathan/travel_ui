import 'package:nimmy_app/Helpers/Navigations/NavigationConfig.dart';
import 'package:nimmy_app/Helpers/Utility/ErrorHandling.dart';
import 'package:nimmy_app/Pages/HomeScreen/HomeScreenModel.dart';

class HomeScreenVM extends HomeScreenModel {
  void navigateToLoginScreen() {
    try {
      pushReplace(NavigationConfig.login);
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  Future<void> getUserDetails() async {
    try {
      var result = await firebaseAuthService.getUser();

      if (result.keys.any((element) => element == 'email')) {
        var email = (result["email"] ?? '').split('@').first;
        email = email[0].toUpperCase() + email.substring(1);
        setUserName(email);
      }
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  Future<void> logoutUser() async {
    try {
      var result = await firebaseAuthService.logoutUser();

      if (result ?? false) {
        navigateToLoginScreen();
      }
    } on Exception catch (ex) {
      ex.logException();
    }
  }
}
