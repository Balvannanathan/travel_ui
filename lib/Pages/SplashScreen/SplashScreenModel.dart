import 'package:mobx/mobx.dart';
import 'package:nimmy_app/Helpers/Navigations/NavigationMixin.dart';
part 'SplashScreenModel.g.dart';

class SplashScreenModel = _SplashScreenModelBase with _$SplashScreenModel;

abstract class _SplashScreenModelBase with Store, NavigationMixin {
  @observable
  int count = 0;

  @action
  void setCount(int count){
    count = this.count;
  }
}