// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OnboardingScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingScreenModel on _OnboardingScreenModelBase, Store {
  late final _$carouselDataAtom = Atom(
    name: '_OnboardingScreenModelBase.carouselData',
    context: context,
  );

  @override
  List<Map<String, String>>? get carouselData {
    _$carouselDataAtom.reportRead();
    return super.carouselData;
  }

  bool _carouselDataIsInitialized = false;

  @override
  set carouselData(List<Map<String, String>>? value) {
    _$carouselDataAtom.reportWrite(
      value,
      _carouselDataIsInitialized ? super.carouselData : null,
      () {
        super.carouselData = value;
        _carouselDataIsInitialized = true;
      },
    );
  }

  late final _$currentPageIndexAtom = Atom(
    name: '_OnboardingScreenModelBase.currentPageIndex',
    context: context,
  );

  @override
  int? get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  bool _currentPageIndexIsInitialized = false;

  @override
  set currentPageIndex(int? value) {
    _$currentPageIndexAtom.reportWrite(
      value,
      _currentPageIndexIsInitialized ? super.currentPageIndex : null,
      () {
        super.currentPageIndex = value;
        _currentPageIndexIsInitialized = true;
      },
    );
  }

  late final _$_OnboardingScreenModelBaseActionController = ActionController(
    name: '_OnboardingScreenModelBase',
    context: context,
  );

  @override
  void setCarouselData(List<Map<String, String>> value) {
    final _$actionInfo = _$_OnboardingScreenModelBaseActionController
        .startAction(name: '_OnboardingScreenModelBase.setCarouselData');
    try {
      return super.setCarouselData(value);
    } finally {
      _$_OnboardingScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentPageIndex(int index) {
    final _$actionInfo = _$_OnboardingScreenModelBaseActionController
        .startAction(name: '_OnboardingScreenModelBase.setCurrentPageIndex');
    try {
      return super.setCurrentPageIndex(index);
    } finally {
      _$_OnboardingScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carouselData: ${carouselData},
currentPageIndex: ${currentPageIndex}
    ''';
  }
}
