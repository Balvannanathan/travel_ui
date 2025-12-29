import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';
import 'package:nimmy_app/Helpers/Resources/Styles.dart';
import 'package:nimmy_app/Pages/ReusableViews/CustomButton.dart';
import 'package:nimmy_app/Pages/ReusableViews/CustomCheckBox.dart';
import 'package:nimmy_app/Pages/ReusableViews/CustomTextField.dart';
import 'package:nimmy_app/Pages/ReusableViews/TextInputFormatters.dart';
import 'package:nimmy_app/Pages/SignupScreen/SignupScreenVM.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  late final SignupScreenVM _signupScreenVM;

  @override
  void initState() {
    super.initState();

    _signupScreenVM = SignupScreenVM();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            primaryFocus?.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.primaryWhite,
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 159.h),
                      Text("Get Started", style: Styles.signUpTitle),
                      SizedBox(height: 7.h),
                      Text(
                        "by creating a free account.",
                        style: Styles.loginSubTitle,
                      ),
                      SizedBox(height: 22.h),

                      CustomTextField(
                        suffixIcon: Icon(
                          Icons.person_2_rounded,
                          color: AppColors.primaryBlack.withOpacity(0.5),
                        ),
                        hintText: 'Full name',
                        maxLength: 255,
                        keyboardType: TextInputType.name,
                        textController: fullNameController,
                        inputFormatter: [FullNameInputFormatter()],
                        onChangeFunction: (value) {
                          _signupScreenVM.updateFullName(value);
                        },
                      ),

                      SizedBox(height: 10.h),

                      CustomTextField(
                        suffixIcon: Icon(
                          Icons.mail_outlined,
                          color: AppColors.primaryBlack.withOpacity(0.5),
                        ),
                        hintText: 'Valid email',
                        maxLength: 255,
                        keyboardType: TextInputType.emailAddress,
                        textController: emailController,
                        inputFormatter: [EmailInputFormatter()],
                        validatorFunction: (value) {
                          return _signupScreenVM.emailValidator(value);
                        },
                        onChangeFunction: (value) {
                          _signupScreenVM.updateEmailAddress(value);
                        },
                      ),

                      SizedBox(height: 10.h),

                      CustomTextField(
                        suffixIcon: Icon(
                          Icons.phone_android_rounded,
                          color: AppColors.primaryBlack.withOpacity(0.5),
                        ),
                        hintText: 'Phone number',
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        textController: phoneNumberController,
                        inputFormatter: [MobileNumberInputFormatter()],
                        onChangeFunction: (value) {
                          _signupScreenVM.updatePhoneNumber(value);
                        },
                      ),

                      SizedBox(height: 10.h),

                      CustomTextField(
                        suffixIcon: _signupScreenVM.isPasswordShown
                            ? Icon(
                                Icons.remove_red_eye_rounded,
                                size: 24.sp,
                                color: AppColors.carouselGrey,
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Image.asset(
                                  'lib/Helpers/Resources/Images/eye-crossed.png',
                                  width: 12.w,
                                  height: 12.h,
                                ),
                              ),
                        suffixIconFuncion: () {
                          _signupScreenVM.updateIsPasswordShown();
                        },
                        hintText: 'Password',
                        maxLength: 255,
                        isPassword: !_signupScreenVM.isPasswordShown,
                        keyboardType: TextInputType.visiblePassword,
                        textController: passwordController,
                        inputFormatter: [PasswordInputFormatter()],
                        validatorFunction: (value) {
                          return _signupScreenVM.passwordValidator(value);
                        },

                        onChangeFunction: (value) {
                          _signupScreenVM.updatePassword(value);
                        },
                      ),

                      SizedBox(height: 18.h),

                      _otherOptionsRow(context),

                      SizedBox(height: 160.h),

                      CustomButton(
                        buttonText: 'Next',
                        onTap: _signupScreenVM.isNextButtonEnabled
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  print('Valid');
                                }
                              }
                            : null,
                      ),

                      SizedBox(height: 15.h),

                      _loginOptions(context),

                      SizedBox(height: 37.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _loginOptions(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already a member?',
          style: TextStyle(
            fontFamily: "MulishRegular",
            fontSize: 13.sp,
            color: AppColors.primaryBlack,
          ),
        ),
        GestureDetector(
          onTap: () => _signupScreenVM.navigateToLoginScreen(),
          child: Text(
            ' Login',
            style: TextStyle(
              fontFamily: "MulishBold",
              fontSize: 13.sp,
              color: AppColors.primaryRed,
            ),
          ),
        ),
      ],
    );
  }

  Widget _otherOptionsRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCheckBox(
          onTap: () {
            _signupScreenVM.updateIsAgreedTerms();
          },
          value: _signupScreenVM.isAgreedTerms,
        ),
        SizedBox(width: 5.w),
        Text(
          'By checking the box you agree to our',
          style: TextStyle(
            fontFamily: "MulishRegular",
            fontSize: 10.sp,
            color: AppColors.primaryBlack,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            ' Terms ',
            style: TextStyle(
              fontFamily: "MulishRegular",
              fontSize: 10.sp,
              color: AppColors.primaryRed,
            ),
          ),
        ),
        Text(
          'and',
          style: TextStyle(
            fontFamily: "MulishRegular",
            fontSize: 10.sp,
            color: AppColors.primaryBlack,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            ' Conditions',
            style: TextStyle(
              fontFamily: "MulishRegular",
              fontSize: 10.sp,
              color: AppColors.primaryRed,
            ),
          ),
        ),
      ],
    );
  }
}
