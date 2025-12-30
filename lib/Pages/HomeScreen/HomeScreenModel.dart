import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:nimmy_app/Helpers/Navigations/NavigationMixin.dart';
import 'package:nimmy_app/Services/FirebaseAuthService/IFirebaseAuthService.dart';
part 'HomeScreenModel.g.dart';

class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel;

abstract class _HomeScreenModelBase with Store, NavigationMixin {
  final IFirebaseAuthService firebaseAuthService = GetIt.instance
      .get<IFirebaseAuthService>();

  @observable
  String userName = '';

  @action
  void setUserName(String value) {
    userName = value;
  }
}
