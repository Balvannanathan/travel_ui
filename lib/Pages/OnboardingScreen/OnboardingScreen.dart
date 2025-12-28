import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';
import 'package:nimmy_app/Helpers/Resources/Styles.dart';
import 'package:nimmy_app/Pages/OnboardingScreen/OnboardingScreenVM.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final OnboardingScreenVM _onboardingScreenVM;

  CarouselSliderController carouselController = CarouselSliderController();
  @override
  void initState() {
    super.initState();

    _onboardingScreenVM = OnboardingScreenVM();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Scaffold(
        backgroundColor: AppColors.primaryWhite,
        body: Column(
          children: [
            CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 174.h),
                    _carouselImage(context),
                    SizedBox(height: 168.63.h),
                    _carouselText(context),
                    _carouselSubText(context),
                    SizedBox(height: 34.h),
                  ],
                );
              },
              // carouselController: carouselController,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  _onboardingScreenVM.updateCurrentIndex(index);
                },
                enableInfiniteScroll: false,
                padEnds: false,
                height: 700.h,
                viewportFraction: 1,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(
                  builder: (context) {
                    return _carouseIndicator(
                      context,
                      _onboardingScreenVM.currentPageIndex ?? 0,
                    );
                  },
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 50.w),
                  child: _floatingButton(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _carouselImage(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(left: 15.w, right: 50.w),
          child: Center(
            child: Image.asset(
              'lib/Helpers/Resources/Images/${_onboardingScreenVM.carouselData?[_onboardingScreenVM.currentPageIndex ?? 0]["image"] ?? ''}.png',
              width: 300.w,
              height: 178.37.h,
            ),
          ),
        );
      },
    );
  }

  Widget _carouselText(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(left: 15.w, right: 50.w),
          child: Text(
            _onboardingScreenVM.carouselData?[_onboardingScreenVM
                        .currentPageIndex ??
                    0]["headText"] ??
                '',
            style: Styles.carouselPrimaryText,
          ),
        );
      },
    );
  }

  Widget _carouselSubText(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(left: 15.w, right: 50.w),
          child: Text(
            _onboardingScreenVM.carouselData?[_onboardingScreenVM
                        .currentPageIndex ??
                    0]["subText"] ??
                '',
            style: Styles.carouselSubText,
          ),
        );
      },
    );
  }

  Widget _carouseIndicator(BuildContext context, int selectedIndex) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 50.w),
      child: Row(
        children: [
          ...List.generate(3, (index) {
            return GestureDetector(
              onTap: () {
                _onboardingScreenVM.updateCurrentIndex(
                  (_onboardingScreenVM.currentPageIndex ?? 0) + 1,
                );
              },
              behavior: HitTestBehavior.translucent,
              child: Padding(
                padding: EdgeInsets.only(right: index != 3 ? 3.w : 0),
                child: Container(
                  width: 16.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: index == selectedIndex
                        ? AppColors.primaryRed
                        : AppColors.secondaryRed,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _floatingButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onboardingScreenVM.updateCurrentIndex(
          (_onboardingScreenVM.currentPageIndex ?? 0) + 1,
        );
      },
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryBlack,
        ),
        child: Center(
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 30.sp,
            color: AppColors.primaryWhite,
          ),
        ),
      ),
    );
  }
}
