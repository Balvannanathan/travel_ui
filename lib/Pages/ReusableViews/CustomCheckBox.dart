import 'package:flutter/material.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';
import 'package:nimmy_app/Helpers/Resources/Styles.dart';

class CustomCheckBox extends StatelessWidget {
  final Function onTap;
  final bool value;
  const CustomCheckBox({super.key, required this.onTap, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
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
