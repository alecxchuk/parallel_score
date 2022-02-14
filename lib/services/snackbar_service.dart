import 'package:flutter/material.dart';
import 'package:parallel_score/utils/constants/colors.dart';
import 'package:parallel_score/utils/enums.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

// enum SnackBarType { Success, Failure }

class AppSnackBar {
  static void setupSnackbarUi() {
    final service = locator<SnackbarService>();

    service.registerCustomSnackbarConfig(
      variant: SnackbarType.success,
      config: SnackbarConfig(
        backgroundColor: AppColors.successColor,
        textColor: AppColors.whiteColor,
        borderRadius: 1,
        dismissDirection: DismissDirection.horizontal,
        // animationDuration: const Duration(seconds: 3),
        margin: const EdgeInsets.only(bottom: 0, right: 0, left: 0),
        barBlur: 0.6,
        messageColor: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
      ),
    );

    service.registerCustomSnackbarConfig(
      variant: SnackbarType.failure,
      config: SnackbarConfig(
        backgroundColor: AppColors.errorColor.withOpacity(0.6),
        textColor: AppColors.whiteColor,
        borderRadius: 1,
        dismissDirection: DismissDirection.horizontal,
        // animationDuration: const Duration(seconds: 3),
        margin: const EdgeInsets.only(bottom: 0, right: 0, left: 0),
        barBlur: 0.6,
        messageColor: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
      ),
    );
  }
}
