import 'package:nimmy_app/Helpers/Navigations/NavigationConfig.dart';
import 'package:nimmy_app/Pages/SplashScreen/SplashScreenModel.dart';

class SplashScreenVM extends SplashScreenModel {
  void navigateToLoginScreen() {
    pushReplace(NavigationConfig.onboarding);
  }
}
