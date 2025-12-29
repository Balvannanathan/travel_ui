// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ForgetPasswordScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgetPasswordScreenModel on _ForgetPasswordScreenModelBase, Store {
  late final _$otpAtom = Atom(
    name: '_ForgetPasswordScreenModelBase.otp',
    context: context,
  );

  @override
  String get otp {
    _$otpAtom.reportRead();
    return super.otp;
  }

  @override
  set otp(String value) {
    _$otpAtom.reportWrite(value, super.otp, () {
      super.otp = value;
    });
  }

  late final _$isResendCodeShownAtom = Atom(
    name: '_ForgetPasswordScreenModelBase.isResendCodeShown',
    context: context,
  );

  @override
  bool get isResendCodeShown {
    _$isResendCodeShownAtom.reportRead();
    return super.isResendCodeShown;
  }

  @override
  set isResendCodeShown(bool value) {
    _$isResendCodeShownAtom.reportWrite(value, super.isResendCodeShown, () {
      super.isResendCodeShown = value;
    });
  }

  late final _$_ForgetPasswordScreenModelBaseActionController =
      ActionController(
        name: '_ForgetPasswordScreenModelBase',
        context: context,
      );

  @override
  void setOtp(String value) {
    final _$actionInfo = _$_ForgetPasswordScreenModelBaseActionController
        .startAction(name: '_ForgetPasswordScreenModelBase.setOtp');
    try {
      return super.setOtp(value);
    } finally {
      _$_ForgetPasswordScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsResendCodeShown(bool value) {
    final _$actionInfo = _$_ForgetPasswordScreenModelBaseActionController
        .startAction(
          name: '_ForgetPasswordScreenModelBase.setIsResendCodeShown',
        );
    try {
      return super.setIsResendCodeShown(value);
    } finally {
      _$_ForgetPasswordScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
otp: ${otp},
isResendCodeShown: ${isResendCodeShown}
    ''';
  }
}
