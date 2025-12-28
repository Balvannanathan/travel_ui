// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenModel on _LoginScreenModelBase, Store {
  late final _$isPasswordShownAtom = Atom(
    name: '_LoginScreenModelBase.isPasswordShown',
    context: context,
  );

  @override
  bool get isPasswordShown {
    _$isPasswordShownAtom.reportRead();
    return super.isPasswordShown;
  }

  @override
  set isPasswordShown(bool value) {
    _$isPasswordShownAtom.reportWrite(value, super.isPasswordShown, () {
      super.isPasswordShown = value;
    });
  }

  late final _$isRemeberMeAtom = Atom(
    name: '_LoginScreenModelBase.isRemeberMe',
    context: context,
  );

  @override
  bool get isRemeberMe {
    _$isRemeberMeAtom.reportRead();
    return super.isRemeberMe;
  }

  @override
  set isRemeberMe(bool value) {
    _$isRemeberMeAtom.reportWrite(value, super.isRemeberMe, () {
      super.isRemeberMe = value;
    });
  }

  late final _$_LoginScreenModelBaseActionController = ActionController(
    name: '_LoginScreenModelBase',
    context: context,
  );

  @override
  void setisPasswordShown(bool value) {
    final _$actionInfo = _$_LoginScreenModelBaseActionController.startAction(
      name: '_LoginScreenModelBase.setisPasswordShown',
    );
    try {
      return super.setisPasswordShown(value);
    } finally {
      _$_LoginScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setisRemeberMe(bool value) {
    final _$actionInfo = _$_LoginScreenModelBaseActionController.startAction(
      name: '_LoginScreenModelBase.setisRemeberMe',
    );
    try {
      return super.setisRemeberMe(value);
    } finally {
      _$_LoginScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordShown: ${isPasswordShown},
isRemeberMe: ${isRemeberMe}
    ''';
  }
}
