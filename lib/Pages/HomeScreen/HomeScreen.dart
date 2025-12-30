import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';
import 'package:nimmy_app/Helpers/Resources/Styles.dart';
import 'package:nimmy_app/Pages/HomeScreen/HomeScreenVM.dart';
import 'package:nimmy_app/Pages/ReusableViews/CustomButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenVM _homeScreenVM = HomeScreenVM();

  @override
  void initState() {
    super.initState();

    _homeScreenVM.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.primaryWhite,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 139.h),
        
                Text('Welcome to Home ${_homeScreenVM.userName} !', style: Styles.loginTitle),
        
                SizedBox(height: 105.h),
        
                Image.asset(
                  'lib/Helpers/Resources/Images/home.png',
                  width: 300.w,
                  height: 155.01,
                ),
        
                SizedBox(height: 30.h),
                CustomButton(
                  buttonText: 'Logout',
                  onTap: () {
                    _homeScreenVM.logoutUser();
                  },
                  isIconRequired: false,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
