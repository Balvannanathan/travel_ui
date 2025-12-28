import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';
import 'package:nimmy_app/Helpers/Resources/Styles.dart';

class LoginTextField extends StatelessWidget {
  final Widget suffixIcon;
  final String hintText;
  final bool? isPassword;
  final int? maxLength;
  final Function? validatorFunction;
  final List<TextInputFormatter>? inputFormatter;
  final Function? suffixIconFuncion;
  final TextEditingController textController;

  const LoginTextField({
    super.key,
    required this.suffixIcon,
    this.isPassword = false,
    this.suffixIconFuncion,
    this.maxLength,
    this.inputFormatter,
    this.validatorFunction,
    required this.hintText,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      maxLength: maxLength ?? 255,
      cursorHeight: 14.h,
      style: Styles.textField,
      inputFormatters: inputFormatter ?? [],
      obscureText: isPassword ?? false,
      validator: validatorFunction != null
          ? (value) {
              String? result = validatorFunction!(value);

              print(result ?? '');
              return result;
            }
          : null,
      onChanged: (value) => textController.text = value,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 7.w, top: 16.h, bottom: 16.h),
        fillColor: AppColors.checkBoxGrey.withAlpha(60),
        filled: true,
        hint: Text(hintText, style: Styles.textHint),
        suffixIcon: GestureDetector(
          onTap: hintText.toLowerCase() == 'password'
              ? () {
                  suffixIconFuncion!();
                }
              : null,
          child: suffixIcon,
        ),
        suffixIconColor: AppColors.primaryBlack,
        counterText: '',
        helperText: ' ',
        // constraints: BoxConstraints(maxHeight: 50.h),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
