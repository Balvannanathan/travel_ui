import 'package:nimmy_app/Helpers/Navigations/NavigationConfig.dart';
import 'package:nimmy_app/Pages/LoginScreen/LoginScreenModel.dart';

class LoginScreenVM extends LoginScreenModel {
  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  void navigateToSignUpScreen() {
    try {
      push(NavigationConfig.signup);
    } catch (ex) {
      print(ex);
    }
  }

  void navigateToForgetPasswordScreen() {
    try {
      push(NavigationConfig.forget);
    } catch (ex) {
      print(ex);
    }
  }

  void updateIsPasswordShown() {
    try {
      setisPasswordShown(!isPasswordShown);
    } catch (ex) {
      print(ex);
    }
  }

  void updateEmailErrorText(String value) {
    try {
      setEmailErrorText(value);
    } catch (ex) {
      print(ex);
    }
  }

  void updateIsRemeberMe() {
    try {
      setisRemeberMe(!isRemeberMe);
    } catch (ex) {
      print(ex);
    }
  }
}
