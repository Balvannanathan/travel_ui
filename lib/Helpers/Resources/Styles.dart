import 'package:flutter/material.dart';
import 'package:nimmy_app/Helpers/Resources/ResponsiveUI.dart';

class AppColors {
  static const Color primaryWhite = Color(0xffFFFFFF);
  static const Color primaryBlack = Color(0xff000000);
  static const Color secondaryBlack = Color(0xff252525);
  static const Color carouselGrey = Color(0xff929292);
  static const Color checkBoxGrey = Color(0xffCBCBCB);
  static const Color primaryRed = Color(0xffFF3951);
  static const Color secondaryRed = Color(0xffFF7686);
}

class Styles {
  Styles._();

  /// Base builder
  static TextStyle _base({
    required String fontFamily,
    required double fontSize,
    FontWeight? fontWeight,
    required Color color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle get nicoRegular => _base(
    fontFamily: "NicoMojiRegular",
    fontSize: 48,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryWhite,
  );

  static TextStyle get carouselPrimaryText => _base(
    fontFamily: "MulishExtraBold",
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBlack,
  );

  static TextStyle get carouselSubText => _base(
    fontFamily: "MulishLight",
    fontSize: 26,
    fontWeight: FontWeight.normal,
    color: AppColors.carouselGrey,
  );

  static TextStyle get loginTitle => _base(
    fontFamily: "MulishExtraBold",
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryBlack,
  );

  static TextStyle get loginSubTitle => _base(
    fontFamily: "MulishLight",
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryBlack,
  );

  static TextStyle get textHint => _base(
    fontFamily: "MulishRegular",
    fontSize: 14,
    color: AppColors.primaryBlack,
  );

  static TextStyle get textField => _base(
    fontFamily: "MulishSemiBold",
    fontSize: 14,
    color: AppColors.primaryBlack,
  );

  static TextStyle get customButtonText => _base(
    fontFamily: "MulishSemiBold",
    fontSize: 20,
    color: AppColors.primaryWhite,
  );
}
