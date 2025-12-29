import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';
import 'package:nimmy_app/Helpers/Resources/Styles.dart';
import 'package:nimmy_app/Pages/ForgetPasswordScreen/ForgetPasswordScreenVM.dart';
import 'package:nimmy_app/Pages/ReusableViews/CustomButton.dart';
import 'package:pinput/pinput.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController pinController = TextEditingController();
  late final ForgetPasswordScreenVM _forgetPasswordScreenVM;

  @override
  void initState() {
    super.initState();

    _forgetPasswordScreenVM = ForgetPasswordScreenVM();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.primaryWhite,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 104.h),

                  Text('Almost there', style: Styles.signUpTitle),

                  SizedBox(height: 35.h),

                  _emailContactSection(context),

                  SizedBox(height: 61.h),

                  _otpPinput(context),

                  SizedBox(height: 61.h),

                  CustomButton(
                    buttonText: 'Verify',
                    isIconRequired: false,
                    onTap: _forgetPasswordScreenVM.otp.length < 6
                        ? null
                        : () {},
                  ),

                  SizedBox(height: 46.h),

                  _resendSection(context),

                  SizedBox(height: 178.h),

                  _floatingButton(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _emailContactSection(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Please enter the 6-digit code sent to your email ',
            style: Styles.loginSubTitle,
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: () => _forgetPasswordScreenVM.navigateToEmailScreen(),
              child: Text(
                _forgetPasswordScreenVM.contactEmail,
                style: Styles.textField.copyWith(color: AppColors.primaryRed),
              ),
            ),
          ),
          TextSpan(text: ' for verification.', style: Styles.loginSubTitle),
        ],
      ),
    );
  }

  Widget _otpPinput(BuildContext context) {
    return Center(
      child: Pinput(
        length: 6,
        defaultPinTheme: PinTheme(
          width: 50.w,
          height: 50.h,
          textStyle: Styles.textHint,
          decoration: BoxDecoration(
            color: AppColors.pinputBackground.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        controller: pinController,
        onChanged: (value) => _forgetPasswordScreenVM.updateOtp(value),
        onCompleted: (value) => _forgetPasswordScreenVM.updateOtp(value),
        closeKeyboardWhenCompleted: true,
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.number,
        animationCurve: Curves.bounceInOut,
        enableSuggestions: true,
        separatorBuilder: (index) => SizedBox(width: 14.w),
      ),
    );
  }

  Widget _resendSection(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _forgetPasswordScreenVM.isResendCodeShown
              ? RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Didn’t receive any code?',
                        style: Styles.textField,
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: GestureDetector(
                          onTap: () => _forgetPasswordScreenVM
                              .updateIsResendCodeShown(false),
                          child: Text(
                            ' Resend Again',
                            style: Styles.textField.copyWith(
                              color: AppColors.primaryRed,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Request a new code in ",
                        style: Styles.textHint,
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: CountdownTimer(
                          endTime:
                              DateTime.now().millisecondsSinceEpoch + 1000 * 30,
                          widgetBuilder: (context, time) {
                            final int sec = time?.sec ?? 0;
                            final String formatted = sec.toString().padLeft(
                              2,
                              '0',
                            );
                            return Text(
                              '00:${formatted}s',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            );
                          },
                          onEnd: () => _forgetPasswordScreenVM
                              .updateIsResendCodeShown(true),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget _floatingButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _forgetPasswordScreenVM.navigateToBack();
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
            Icons.arrow_back_ios_rounded,
            size: 30.sp,
            color: AppColors.primaryWhite,
          ),
        ),
      ),
    );
  }
}
