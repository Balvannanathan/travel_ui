import 'package:flutter/material.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';
import 'package:nimmy_app/Helpers/Resources/Styles.dart';
import 'package:nimmy_app/Pages/SplashScreen/SplashScreenVM.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashScreenVM _splashScreeVM;

  @override
  void initState() {
    super.initState();

    _splashScreeVM = SplashScreenVM();

    Future.delayed(Duration(seconds: 3), () {
      _splashScreeVM.navigateToLoginScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryRed,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'lib/Helpers/Resources/Images/splash.png',
              width: 200.w,
              height: 152.6.h,
            ),
            SizedBox(height: 16.h),
            Text("Travello", style: Styles.nicoRegular),
          ],
        ),
      ),
    );
  }
}
