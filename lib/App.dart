import 'package:flutter/material.dart';
import 'package:nimmy_app/Helpers/AppConstants/AppConstants.dart';
import 'package:nimmy_app/Helpers/Navigations/NavigationConfig.dart';
import 'package:nimmy_app/Helpers/Navigations/NavigationHelper.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ResponsiveUI(
      screenWidth: Appconstants.baseWidth,
      screenHeight: Appconstants.baseHeight,
    );

    return MaterialApp(
      title: 'Nimmy App',
      navigatorKey: NavigationHelper.navigatorKey,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => NavigationConfig.splash.builder(null),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
