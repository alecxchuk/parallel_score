import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyle {
  static const double _size10 = 10;
  static const double _size11 = 11;
  static const double _size12 = 12;
  static const double _size14 = 14;
  static const double _size16 = 16;
  static const double _size18 = 18;
  // static const double _size18 = 19;
  static const double _size20 = 20;
  static const double _size24 = 24.0;
  static const double _size32 = 32.0;
  static const double _size34 = 34.0;
  static const double _size48 = 48.0;

  static const FontWeight _weight500 = FontWeight.w500;
  static const FontWeight _normalWeight = FontWeight.w400;
  static const FontWeight _weight600 = FontWeight.w600;
  static const FontWeight _boldWeight = FontWeight.w700;
  static const FontWeight _weight900 = FontWeight.w900;

  static TextStyle white48 = _base(_size48, _weight900, AppColors.whiteColor);
  static TextStyle white34 = _base(_size34, _weight900, AppColors.whiteColor);

  static TextStyle headline = _base(_size34, _boldWeight, AppColors.blackColor);
  static TextStyle headlineWhite =
      _base(_size34, _boldWeight, AppColors.whiteColor);
  static TextStyle headlineSale =
      _base(_size34, _boldWeight, AppColors.saleColor);
  static TextStyle headline2 = _base(_size24, _weight600, AppColors.blackColor);
  static TextStyle headline2White =
      _base(_size24, _weight600, AppColors.whiteColor);
  static TextStyle headline3 = _base(_size18, _weight600, AppColors.blackColor);

  static TextStyle subHeadText =
      _base(_size16, _weight600, AppColors.blackColor);
  static TextStyle subHeadText11White =
      _base(_size11, _weight600, AppColors.whiteColor);
  static TextStyle subHeadTextWhite =
      _base(_size16, _weight600, AppColors.whiteColor);
  static TextStyle subHeadText10White =
      _base(_size10, _weight600, AppColors.whiteColor);
  static TextStyle subHeadText14White =
      _base(_size11, _weight600, AppColors.whiteColor);

  static TextStyle texts = _base(_size16, _normalWeight, AppColors.blackColor);

  static TextStyle descrItemText =
      _base(_size14, _weight500, AppColors.blackColor);
  static TextStyle descrItemTextWhite =
      _base(_size14, _weight500, AppColors.whiteColor);

  static TextStyle normalText14White =
      _base(_size14, _normalWeight, AppColors.whiteColor);
  static TextStyle normalText14Black =
      _base(_size14, _normalWeight, AppColors.blackColor);

  static TextStyle normalText11White =
      _base(_size11, _normalWeight, AppColors.whiteColor);
  static TextStyle normalText11Black =
      _base(_size11, _normalWeight, AppColors.blackColor);

  static TextStyle normalText16Black =
      _base(_size16, _normalWeight, AppColors.blackColor);

  static TextStyle boldText14White =
      _base(_size14, _boldWeight, AppColors.whiteColor);
  static TextStyle boldText14 =
      _base(_size14, _boldWeight, AppColors.blackColor);

  static TextStyle helperText10 =
      _base(_size10, _normalWeight, AppColors.appGrey);
  static TextStyle helperText =
      _base(_size11, _normalWeight, AppColors.appGrey);
  static TextStyle helperText14 =
      _base(_size14, _normalWeight, AppColors.appGrey);
  static TextStyle helperText14_500 =
      _base(_size14, _weight500, AppColors.appGrey);
  static TextStyle helperText16 =
      _base(_size16, _normalWeight, AppColors.appGrey);
  static TextStyle helperText16_500 =
      _base(_size16, _weight600, AppColors.appGrey);

  static TextStyle saleText10 =
      _base(_size14, _normalWeight, AppColors.saleColor);
  static TextStyle saleText12_600 =
      _base(_size12, _weight600, AppColors.saleColor);
  static TextStyle saleText14_500 =
      _base(_size14, _weight500, AppColors.saleColor);
  static TextStyle saleText16_600 =
      _base(_size16, _weight600, AppColors.saleColor);

  static TextStyle textFieldInput =
      _base(_size14, _weight500, AppColors.textfieldColor);

  static TextStyle successText =
      _base(_size14, _weight500, AppColors.successColor);

  static TextStyle errorText =
      _base(_size11, _normalWeight, AppColors.errorColor);
  static TextStyle errorText500 =
      _base(_size14, _weight500, AppColors.errorColor);

  static TextStyle pendingText500 =
      _base(_size14, _weight500, AppColors.amberColor);

  //#base style
  static TextStyle _base(
    double size,
    FontWeight? fontWeight,
    Color? color,
  ) {
    return baseStyle(fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle baseStyle({
    double fontSize = 13,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.grey[600],
    );
  }
}
