import 'package:mobx/mobx.dart';
import 'package:nimmy_app/Helpers/Navigations/NavigationMixin.dart';
part 'ForgetPasswordScreenModel.g.dart';

class ForgetPasswordScreenModel = _ForgetPasswordScreenModelBase
    with _$ForgetPasswordScreenModel;

abstract class _ForgetPasswordScreenModelBase with Store, NavigationMixin {
  String contactEmail = "contact.uiuxexperts@gmail.com";

  @observable
  String otp = '';

  @action
  void setOtp(String value) {
    otp = value;
  }

  @observable
  bool isResendCodeShown = true;

  @action
  void setIsResendCodeShown(bool value) {
    isResendCodeShown = value;
  }
}
