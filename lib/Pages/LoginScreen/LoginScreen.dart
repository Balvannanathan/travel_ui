import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';
import 'package:nimmy_app/Helpers/Resources/Styles.dart';
import 'package:nimmy_app/Pages/LoginScreen/LoginScreenVM.dart';
import 'package:nimmy_app/Pages/ReusableViews/CustomButton.dart';
import 'package:nimmy_app/Pages/ReusableViews/CustomTextField.dart';
import 'package:nimmy_app/Pages/ReusableViews/TextInputFormatters.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  late final LoginScreenVM _loginScreenVM;

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _loginScreenVM = LoginScreenVM();
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
            backgroundColor: AppColors.primaryWhite,
            resizeToAvoidBottomInset: false,
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
                    children: [
                      SizedBox(height: 187.h),
                      Text("Welcome back", style: Styles.loginTitle),
                      SizedBox(height: 3.h),
                      Text(
                        "sign in to access your account",
                        style: Styles.loginSubTitle,
                      ),
                      SizedBox(height: 107.h),

                      Visibility(
                        visible: _loginScreenVM.loginErrorText.isNotEmpty,
                        child: Text(
                          _loginScreenVM.loginErrorText,
                          style: Styles.textField.copyWith(
                            color: AppColors.primaryRed,
                          ),
                        ),
                      ),

                      CustomTextField(
                        hintText: 'Enter your email',
                        textController: emailController,
                        onChangeFunction: (value) {
                          _loginScreenVM.updateIsNextButtonEnabled(
                            passwordController.text.isNotEmpty &&
                                emailController.text.isNotEmpty,
                          );
                        },
                        maxLength: 255,
                        validatorFunction: (value) {
                          return _loginScreenVM.emailValidator(value);
                        },
                        inputFormatter: [EmailInputFormatter()],
                        suffixIcon: Icon(Icons.mail_outlined, size: 24.sp),
                      ),

                      SizedBox(height: 12.h),

                      CustomTextField(
                        hintText: 'Password',
                        isPassword: !_loginScreenVM.isPasswordShown,
                        maxLength: 8,
                        inputFormatter: [PasswordInputFormatter()],
                        onChangeFunction: (value) {
                          _loginScreenVM.updateIsNextButtonEnabled(
                            passwordController.text.isNotEmpty &&
                                emailController.text.isNotEmpty,
                          );
                        },
                        suffixIconFuncion: () {
                          _loginScreenVM.updateIsPasswordShown();
                        },
                        textController: passwordController,
                        suffixIcon: _loginScreenVM.isPasswordShown
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
                      ),

                      SizedBox(height: 14.h),

                      Visibility(
                        visible: false,
                        child: _otherOptionsRow(context),
                      ),

                      // Spacer(),
                      SizedBox(height: 190.h),

                      CustomButton(
                        buttonText: 'Next',
                        onTap: _loginScreenVM.isNextButtonEnabled
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  _loginScreenVM.loginUser(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                }
                              }
                            : null,
                      ),

                      SizedBox(height: 14.h),

                      _signupOptions(context),

                      SizedBox(height: 38.h),
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

  Widget _otherOptionsRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _checkBox(context, _loginScreenVM.isRemeberMe),
        SizedBox(width: 5.w),
        _optionsText(
          context: context,
          text: 'Remember me',
          color: AppColors.primaryBlack,
        ),
        Spacer(),
        Visibility(
          visible: false,
          // _loginScreenVM.loginErrorText.isNotEmpty,
          child: GestureDetector(
            onTap: () => _loginScreenVM.navigateToForgetPasswordScreen(),
            child: _optionsText(
              context: context,
              text: 'Forget password ?',
              color: AppColors.primaryRed,
            ),
          ),
        ),
      ],
    );
  }

  Widget _signupOptions(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _optionsText(
          context: context,
          text: 'New Member ?',
          color: AppColors.primaryBlack,
          size: 13.sp,
        ),
        GestureDetector(
          onTap: () => _loginScreenVM.navigateToSignUpScreen(),
          child: _optionsText(
            context: context,
            text: ' Register now',
            family: 'MulishBold',
            color: AppColors.primaryRed,
            size: 13.sp,
          ),
        ),
      ],
    );
  }

  Widget _optionsText({
    required BuildContext context,
    required String text,
    required Color color,
    double? size,
    String? family,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: family ?? "MulishRegular",
        fontSize: size ?? 12.sp,
        color: color,
      ),
    );
  }

  Widget _checkBox(BuildContext context, bool value) {
    return GestureDetector(
      onTap: () {
        _loginScreenVM.updateIsRemeberMe();
      },
      child: Container(
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.r),
          border: BoxBorder.all(
            width: 1.w,
            color: AppColors.checkBoxGrey,
            style: BorderStyle.solid,
          ),
        ),
        child: value ? Icon(Icons.check, size: 15.sp) : null,
      ),
    );
  }
}
