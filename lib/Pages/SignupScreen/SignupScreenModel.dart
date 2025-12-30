import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:nimmy_app/Helpers/Navigations/NavigationMixin.dart';
import 'package:nimmy_app/Services/FirebaseAuthService/IFirebaseAuthService.dart';
part 'SignupScreenModel.g.dart';

class SignupScreenModel = _SignupScreenModelBase with _$SignupScreenModel;

abstract class _SignupScreenModelBase with Store, NavigationMixin {
  final IFirebaseAuthService firebaseAuthService = GetIt.instance
      .get<IFirebaseAuthService>();

  @observable
  bool isPasswordShown = false;

  @action
  void setisPasswordShown(bool value) {
    isPasswordShown = value;
  }

  @observable
  bool isAgreedTerms = false;

  @action
  void setIsAgreedTerms(bool value) {
    isAgreedTerms = value;
  }

  @observable
  String fullName = '';

  @action
  void setFullName(String value) {
    fullName = value;
  }

  @observable
  String emailAddress = '';

  @action
  void setEmailAddress(String value) {
    emailAddress = value;
  }

  @observable
  String phoneNumber = '';

  @action
  void setPhoneNumber(String value) {
    phoneNumber = value;
  }

  @observable
  String password = '';

  @action
  void setPassword(String value) {
    password = value;
  }

  @observable
  bool isNextButtonEnabled = false;

  @action
  void setIsNextButtonEnabled(bool value) {
    isNextButtonEnabled = value;
  }
}
