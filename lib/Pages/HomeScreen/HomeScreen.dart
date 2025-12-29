import 'package:flutter/material.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';
import 'package:nimmy_app/Helpers/Resources/Styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 139.h),

            Text('Welcome to Home', style: Styles.loginTitle),

            SizedBox(height: 105.h),

            Image.asset(
              'lib/Helpers/Resources/Images/home.png',
              width: 300.w,
              height: 155.01,
            ),
          ],
        ),
      ),
    );
  }
}
