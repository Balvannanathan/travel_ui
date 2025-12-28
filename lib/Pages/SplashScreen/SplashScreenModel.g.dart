// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SplashScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashScreenModel on _SplashScreenModelBase, Store {
  late final _$countAtom = Atom(
    name: '_SplashScreenModelBase.count',
    context: context,
  );

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  late final _$_SplashScreenModelBaseActionController = ActionController(
    name: '_SplashScreenModelBase',
    context: context,
  );

  @override
  void setCount(int count) {
    final _$actionInfo = _$_SplashScreenModelBaseActionController.startAction(
      name: '_SplashScreenModelBase.setCount',
    );
    try {
      return super.setCount(count);
    } finally {
      _$_SplashScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count}
    ''';
  }
}
