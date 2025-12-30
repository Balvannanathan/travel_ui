import 'package:nimmy_app/BOs/LoginBO/LoginBO.dart';
import 'package:nimmy_app/Helpers/Navigations/NavigationConfig.dart';
import 'package:nimmy_app/Helpers/Utility/ErrorHandling.dart';
import 'package:nimmy_app/Pages/SignupScreen/SignupScreenModel.dart';

class SignupScreenVM extends SignupScreenModel {
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

  Future<void> createNewUser() async {
    try {
      var result = await firebaseAuthService.signupUser(
        LoginBO(email: emailAddress, password: password),
      );

      if (result != null && result.isNotEmpty) {
        navigateToHomeScreen();
      }
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void navigateToHomeScreen() {
    try {
      pushReplace(NavigationConfig.home);
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void validateFields() {
    try {
      if (fullName.isNotEmpty &&
          password.isNotEmpty &&
          emailAddress.isNotEmpty &&
          password.isNotEmpty &&
          isAgreedTerms) {
        setIsNextButtonEnabled(true);
      } else {
        setIsNextButtonEnabled(false);
      }
    } catch (ex) {
      print(ex);
    }
  }

  void navigateToLoginScreen() {
    try {
      pushReplace(NavigationConfig.login);
    } catch (ex) {
      print(ex);
    }
  }

  void updateFullName(String value) {
    try {
      setFullName(value);

      validateFields();
    } catch (ex) {
      print(ex);
    }
  }

  void updateEmailAddress(String value) {
    try {
      setEmailAddress(value);

      validateFields();
    } catch (ex) {
      print(ex);
    }
  }

  void updatePhoneNumber(String value) {
    try {
      setPhoneNumber(value);

      validateFields();
    } catch (ex) {
      print(ex);
    }
  }

  void updatePassword(String value) {
    try {
      setPassword(value);

      validateFields();
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

  void updateIsNextButtonEnabled(bool value) {
    try {
      setIsNextButtonEnabled(value);
    } catch (ex) {
      print(ex);
    }
  }

  void updateIsAgreedTerms() {
    try {
      setIsAgreedTerms(!isAgreedTerms);

      validateFields();
    } catch (ex) {
      print(ex);
    }
  }
}
