import 'package:flutter/material.dart';
import 'package:nimmy_app/Pages/ForgetPasswordScreen/ForgetPasswordScreen.dart';
import 'package:nimmy_app/Pages/LoginScreen/LoginScreen.dart';
import 'package:nimmy_app/Pages/OnboardingScreen/OnboardingScreen.dart';
import 'package:nimmy_app/Pages/SignupScreen/SignUpScreen.dart';
import 'package:nimmy_app/Pages/SplashScreen/SplashScreen.dart';

/// ============================
/// 🔹 Screen Enum (Optional, for logging / analytics)
/// ============================

enum AppScreen {
  SplashScreen,
  LoginScreen,
  OnboardingScreeen,
  SignupScreen,
  ForgetPasswordScreen,
}

/// ============================
/// 🔹 Screen Config
/// ============================

class ScreenConfig {
  final AppScreen screen;
  final Widget Function(dynamic data) builder;

  const ScreenConfig({required this.screen, required this.builder});
}

/// ============================
/// 🔹 Navigation Config
/// ============================

class NavigationConfig {
  NavigationConfig._();

  static var splash = ScreenConfig(
    screen: AppScreen.SplashScreen,
    builder: (_) => SplashScreen(),
  );

  static var onboarding = ScreenConfig(
    screen: AppScreen.OnboardingScreeen,
    builder: (_) => OnboardingScreen(),
  );

  static var login = ScreenConfig(
    screen: AppScreen.LoginScreen,
    builder: (_) => LoginScreen(),
  );

  static var signup = ScreenConfig(
    screen: AppScreen.SignupScreen,
    builder: (_) => SignupScreen(),
  );

  static var forget = ScreenConfig(
    screen: AppScreen.ForgetPasswordScreen,
    builder: (_) => ForgetPasswordScreen(),
  );
}
