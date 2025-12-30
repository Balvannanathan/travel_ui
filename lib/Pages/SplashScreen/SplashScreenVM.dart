import 'package:nimmy_app/Helpers/Navigations/NavigationConfig.dart';
import 'package:nimmy_app/Helpers/Utility/ErrorHandling.dart';
import 'package:nimmy_app/Pages/SplashScreen/SplashScreenModel.dart';

class SplashScreenVM extends SplashScreenModel {
  void navigateToLoginScreen() {
    pushReplace(NavigationConfig.login);
  }

  void navigateToOnboardingScreen() {
    pushReplace(NavigationConfig.onboarding);
  }

  void navigateToHomeScreen() {
    pushReplace(NavigationConfig.home);
  }

  Future<void> getLocalStorage() async {
    try {
      var result = await platformLocalStorageService.getData('isFirstTime');

      if (result == true) {
        checkUserLoggedIn();
      } else {
        navigateToOnboardingScreen();
      }
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  Future<void> checkUserLoggedIn() async {
    try {
      var result = await firebaseAuthService.checkUserLoggedIn();

      if (result ?? false) {
        navigateToHomeScreen();
      } else {
        navigateToLoginScreen();
      }
    } on Exception catch (ex) {
      ex.logException();
    }
  }
}
