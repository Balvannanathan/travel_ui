import 'package:nimmy_app/BOs/LoginBO/LoginBO.dart';
import 'package:nimmy_app/Helpers/Navigations/NavigationConfig.dart';
import 'package:nimmy_app/Helpers/Utility/ErrorHandling.dart';
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

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );

    if (!passwordRegex.hasMatch(value.trim())) {
      return 'Enter a valid password';
    }

    return null;
  }

  Future<void> loginUser(String email, String password) async {
    try {
      // var result = await firebaseAuthService.checkEmail(email);

      // if (result ?? false) {
      var result = await firebaseAuthService.signInUser(
        LoginBO(email: email, password: password),
      );

      if (result != null) {
        if (result.contains('Success')) {
          navigateToHomeScreen();
        } else if (result.contains('wrong-password')) {
          setLoginErrorText('Password is incorrect');
        } else if (result.contains('user-not-found')) {
          setLoginErrorText('User not found');
        }
        else if(result.contains('invalid-credential')) {
          setLoginErrorText('Email/Password is mismatch');
        }
      }
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void navigateToSignUpScreen() {
    try {
      pushReplace(NavigationConfig.signup);
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

  void navigateToHomeScreen() {
    try {
      pushReplace(NavigationConfig.home);
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void updateIsPasswordShown() {
    try {
      setisPasswordShown(!isPasswordShown);
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void updateIsNextButtonEnabled(bool value) {
    try {
      setIsNextButtonEnabled(value);
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
