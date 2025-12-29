import 'package:nimmy_app/Helpers/Utility/ErrorHandling.dart';
import 'package:nimmy_app/Pages/ForgetPasswordScreen/ForgetPasswordScreenModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ForgetPasswordScreenVM extends ForgetPasswordScreenModel {
  void updateOtp(String value) {
    try {
      setOtp(value);
    } catch (ex) {
      print(ex);
    }
  }

  void updateIsResendCodeShown(bool value) {
    try {
      setIsResendCodeShown(value);
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> navigateToEmailScreen() async {
    try {
      var url = Uri(scheme: 'mailto', path: contactEmail);

      await launchUrl(url);
    } catch (ex) {
      print(ex);
    }
  }

  void navigateToBack() {
    try {
      pop();
    } on Exception catch (ex) {
      ex.logException();
    }
  }
}
