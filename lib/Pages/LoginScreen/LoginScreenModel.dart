import 'package:mobx/mobx.dart';
import 'package:nimmy_app/Helpers/Navigations/NavigationMixin.dart';
part 'LoginScreenModel.g.dart';

class LoginScreenModel = _LoginScreenModelBase with _$LoginScreenModel;

abstract class _LoginScreenModelBase with Store, NavigationMixin {
  @observable
  bool isPasswordShown = false;

  @action
  void setisPasswordShown(bool value) {
    isPasswordShown = value;
  }

  @observable
  bool isRemeberMe = false;

  @action
  void setisRemeberMe(bool value) {
    isRemeberMe = value;
  }

  @observable
  bool isNextButtonEnabled = false;

  @action
  void setIsNextButtonEnabled(bool value) {
    isNextButtonEnabled = value;
  }
}
