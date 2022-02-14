import 'package:flutter/material.dart';

import 'colors.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  static const double _verticalSpaceExtraSmall = 4.0;
  static const double _verticalSpaceSmall = 8.0;
  static const double _verticalSpaceMedium = 16.0;
  static const double _verticalSpaceLarge = 32.0;

  static const double _horizontalSpaceExtraSmall = 4.0;
  static const double _horizontalSpaceSmall = 8.0;
  static const double _horizontalSpaceMedium = 16.0;
  static const double _horizontalSpaceLarge = 32.0;

  static const double _thirty = 30.0;
  static const double _twentyfive = 25.0;
  static const double _eight = 8.0;
  static const double _four = 4.0;

  static Widget verticalSpaceExtraSmall = const SizedBox(
    height: _verticalSpaceExtraSmall,
  );
  static Widget verticalSpaceSmall = const SizedBox(
    height: _verticalSpaceSmall,
  );
  static Widget verticalSpaceMedium =
      const SizedBox(height: _verticalSpaceMedium);
  static Widget verticalSpaceLarge =
      const SizedBox(height: _verticalSpaceLarge);
  static Widget horizontalSpaceExtraSmall =
      const SizedBox(width: _horizontalSpaceExtraSmall);
  static Widget horizontalSpaceSmall =
      const SizedBox(width: _horizontalSpaceSmall);
  static Widget horizontalSpaceMedium =
      const SizedBox(width: _horizontalSpaceMedium);
  static Widget horizontalSpaceLarge =
      const SizedBox(width: _horizontalSpaceLarge);
  static Widget customVerticalSpace(double value) => SizedBox(height: value);
  static Widget customHorizontalSpace(double value) => SizedBox(width: value);

  // Border radius
  static BorderRadius largeBorderRadius =
      const BorderRadius.all(Radius.circular(_thirty));

  static BorderRadius bigBorderRadius =
      const BorderRadius.all(Radius.circular(_twentyfive));

  static BorderRadius smallBorderRadius =
      const BorderRadius.all(Radius.circular(_eight));

  static BorderRadius extraSmallBorderRadius =
      const BorderRadius.all(Radius.circular(_four));

  static BorderRadius extraLargeCircularBorderRadius =
      const BorderRadius.all(Radius.elliptical(44, 44));

  static BorderRadius largeCircularBorderRadius =
      const BorderRadius.all(Radius.elliptical(36, 36));

  static BorderRadius customCircularBorder(double value) =>
      BorderRadius.all(Radius.circular(value));

  // Edge Insets
  static EdgeInsets smallPadding = const EdgeInsets.all(_eight);

  static EdgeInsets symmetricSmallpadding =
      const EdgeInsets.symmetric(horizontal: 4.0);

  static EdgeInsets customSymmetricPadding(
          {double? horizontal, double? vertical}) =>
      EdgeInsets.symmetric(
          horizontal: horizontal ?? 0, vertical: vertical ?? 0);
  static EdgeInsets customPadding(value) => EdgeInsets.all(value);

  static BoxDecoration filterPageBoxDecoration =
      BoxDecoration(color: AppColors.whiteColor, boxShadow: [
    BoxShadow(
        color: AppColors.realBlack.withOpacity(0.07),
        offset: const Offset(0, 1),
        blurRadius: 4)
  ]);
}

// Screen Size helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;
double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;



// double screenAwareSize(double value, BuildContext context,
//     {bool width = false}) {
//   if (width) {
//     return MediaQuery.of(context).size.width * (value / 411);
//   } else {
//     return MediaQuery.of(context).size.height * (value / 823);
//   }
// }
