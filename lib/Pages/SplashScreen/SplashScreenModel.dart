import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:nimmy_app/Helpers/Navigations/NavigationMixin.dart';
import 'package:nimmy_app/Services/PlatformLocalStorageService/IPlatformLocalStorageService.dart';
part 'SplashScreenModel.g.dart';

class SplashScreenModel = _SplashScreenModelBase with _$SplashScreenModel;

abstract class _SplashScreenModelBase with Store, NavigationMixin {
  final IPlatformLocalStorageService platformLocalStorageService = GetIt
      .instance
      .get<IPlatformLocalStorageService>();

  @observable
  int count = 0;

  @action
  void setCount(int count) {
    count = this.count;
  }
}
