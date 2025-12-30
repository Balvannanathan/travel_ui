import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nimmy_app/Helpers/Utility/ErrorHandling.dart';
import 'package:nimmy_app/Services/FirebaseAuthService/IFirebaseAuthService.dart';

import '../../BOs/LoginBO/LoginBO.dart';

class FirebaseAuthService implements IFirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<String?> signupUser(LoginBO userData) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );

      print(result.user);
      return result.user?.uid ?? '';
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code} - ${e.message}');

      e.logException();
      return null;
    } on Exception catch (ex) {
      ex.logException();

      return null;
    }
  }

  @override
  Future<String?> signInUser(LoginBO userData) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );

      return 'Success ${credential.user?.uid}';
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code} - ${e.message}');

      e.logException();

      return e.code;
    } on Exception catch (ex) {
      ex.logException();

      return null;
    }
  }

  @override
  Future<bool?> logoutUser() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code} - ${e.message}');

      e.logException();

      return null;
    } on Exception catch (ex) {
      ex.logException();

      return null;
    }
  }

  @override
  Future<bool?> deleteUser() async {
    try {
      var user = _auth.currentUser;

      if (user != null) {
        // Delete Auth account
        await user.delete();

        return true;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code} - ${e.message}');

      e.logException();
      return null;
    } on Exception catch (ex) {
      ex.logException();

      return null;
    }
  }

  @override
  Future<Map<String, String>> getUser() async {
    try {
      return {"email": _auth.currentUser?.email ?? ''};
    } on Exception catch (ex) {
      ex.logException();

      return {};
    }
  }

  @override
  Future<bool?> checkEmail(String email) async {
    try {
      final methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(
        email,
      );

      print(email);

      print(methods.isNotEmpty);

      return methods.isNotEmpty;
    } on Exception catch (ex) {
      ex.logException();

      return null;
    }
  }

  @override
  Future<bool?> checkUserLoggedIn() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (ex) {
      ex.logException();

      return null;
    }
  }
}
