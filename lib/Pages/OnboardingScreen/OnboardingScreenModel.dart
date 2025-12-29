import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:nimmy_app/Helpers/Navigations/NavigationMixin.dart';
import 'package:nimmy_app/Services/PlatformLocalStorageService/IPlatformLocalStorageService.dart';
part 'OnboardingScreenModel.g.dart';

class OnboardingScreenModel = _OnboardingScreenModelBase
    with _$OnboardingScreenModel;

abstract class _OnboardingScreenModelBase with Store, NavigationMixin {
  final IPlatformLocalStorageService platformLocalStorageService = GetIt
      .instance
      .get<IPlatformLocalStorageService>();

  @observable
  late List<Map<String, String>>? carouselData;

  @action
  void setCarouselData(List<Map<String, String>> value) {
    carouselData = value;
  }

  @observable
  late int? currentPageIndex;

  @action
  void setCurrentPageIndex(int index) {
    currentPageIndex = index;
  }
}
