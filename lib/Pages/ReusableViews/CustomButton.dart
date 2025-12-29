import 'package:flutter/material.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';
import 'package:nimmy_app/Helpers/Resources/Styles.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function? onTap;
  final bool? isIconRequired;

  const CustomButton({
    super.key,
    required this.buttonText,
    this.isIconRequired,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap != null ? () => onTap!() : null,
      style: TextButton.styleFrom(
        backgroundColor: onTap != null
            ? AppColors.primaryRed
            : AppColors.secondaryRed.withOpacity(0.5),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(buttonText, style: Styles.customButtonText),
            SizedBox(width: 3.w),
            if (isIconRequired ?? true)
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 25.sp,
                color: AppColors.primaryWhite,
              ),
          ],
        ),
      ),
    );
  }
}
