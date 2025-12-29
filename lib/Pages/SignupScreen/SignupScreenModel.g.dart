// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignupScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupScreenModel on _SignupScreenModelBase, Store {
  late final _$isPasswordShownAtom = Atom(
    name: '_SignupScreenModelBase.isPasswordShown',
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

  late final _$isAgreedTermsAtom = Atom(
    name: '_SignupScreenModelBase.isAgreedTerms',
    context: context,
  );

  @override
  bool get isAgreedTerms {
    _$isAgreedTermsAtom.reportRead();
    return super.isAgreedTerms;
  }

  @override
  set isAgreedTerms(bool value) {
    _$isAgreedTermsAtom.reportWrite(value, super.isAgreedTerms, () {
      super.isAgreedTerms = value;
    });
  }

  late final _$fullNameAtom = Atom(
    name: '_SignupScreenModelBase.fullName',
    context: context,
  );

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  late final _$emailAddressAtom = Atom(
    name: '_SignupScreenModelBase.emailAddress',
    context: context,
  );

  @override
  String get emailAddress {
    _$emailAddressAtom.reportRead();
    return super.emailAddress;
  }

  @override
  set emailAddress(String value) {
    _$emailAddressAtom.reportWrite(value, super.emailAddress, () {
      super.emailAddress = value;
    });
  }

  late final _$phoneNumberAtom = Atom(
    name: '_SignupScreenModelBase.phoneNumber',
    context: context,
  );

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$passwordAtom = Atom(
    name: '_SignupScreenModelBase.password',
    context: context,
  );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$isNextButtonEnabledAtom = Atom(
    name: '_SignupScreenModelBase.isNextButtonEnabled',
    context: context,
  );

  @override
  bool get isNextButtonEnabled {
    _$isNextButtonEnabledAtom.reportRead();
    return super.isNextButtonEnabled;
  }

  @override
  set isNextButtonEnabled(bool value) {
    _$isNextButtonEnabledAtom.reportWrite(value, super.isNextButtonEnabled, () {
      super.isNextButtonEnabled = value;
    });
  }

  late final _$_SignupScreenModelBaseActionController = ActionController(
    name: '_SignupScreenModelBase',
    context: context,
  );

  @override
  void setisPasswordShown(bool value) {
    final _$actionInfo = _$_SignupScreenModelBaseActionController.startAction(
      name: '_SignupScreenModelBase.setisPasswordShown',
    );
    try {
      return super.setisPasswordShown(value);
    } finally {
      _$_SignupScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsAgreedTerms(bool value) {
    final _$actionInfo = _$_SignupScreenModelBaseActionController.startAction(
      name: '_SignupScreenModelBase.setIsAgreedTerms',
    );
    try {
      return super.setIsAgreedTerms(value);
    } finally {
      _$_SignupScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFullName(String value) {
    final _$actionInfo = _$_SignupScreenModelBaseActionController.startAction(
      name: '_SignupScreenModelBase.setFullName',
    );
    try {
      return super.setFullName(value);
    } finally {
      _$_SignupScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailAddress(String value) {
    final _$actionInfo = _$_SignupScreenModelBaseActionController.startAction(
      name: '_SignupScreenModelBase.setEmailAddress',
    );
    try {
      return super.setEmailAddress(value);
    } finally {
      _$_SignupScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneNumber(String value) {
    final _$actionInfo = _$_SignupScreenModelBaseActionController.startAction(
      name: '_SignupScreenModelBase.setPhoneNumber',
    );
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_SignupScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignupScreenModelBaseActionController.startAction(
      name: '_SignupScreenModelBase.setPassword',
    );
    try {
      return super.setPassword(value);
    } finally {
      _$_SignupScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsNextButtonEnabled(bool value) {
    final _$actionInfo = _$_SignupScreenModelBaseActionController.startAction(
      name: '_SignupScreenModelBase.setIsNextButtonEnabled',
    );
    try {
      return super.setIsNextButtonEnabled(value);
    } finally {
      _$_SignupScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordShown: ${isPasswordShown},
isAgreedTerms: ${isAgreedTerms},
fullName: ${fullName},
emailAddress: ${emailAddress},
phoneNumber: ${phoneNumber},
password: ${password},
isNextButtonEnabled: ${isNextButtonEnabled}
    ''';
  }
}
