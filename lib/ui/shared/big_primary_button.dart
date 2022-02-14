import 'package:flutter/material.dart';
import 'package:parallel_score/utils/constants/app_constants.dart';
import 'package:parallel_score/utils/constants/colors.dart';
import 'package:parallel_score/utils/constants/text_styles.dart';
import 'package:parallel_score/utils/constants/ui_helpers.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? labelColor;
  final Color backgroundColor;
  final bool outlined;
  final double? height;
  final double? width;
  final bool? edit;
  final bool active;
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    this.labelColor,
    required this.label,
    this.outlined = false,
    this.active = true,
    this.backgroundColor = AppColors.saleColor,
    this.height,
    this.width,
    this.edit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressed(),
      //elevation: 12,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      fillColor: outlined ? null : backgroundColor,
      splashColor: null,
      // splashColor: outlined
      //     ? AppColors.saleColor.withOpacity(1)
      //     : AppColors.saleColor.withOpacity(0.9),
      highlightColor: outlined
          ? AppColors.whiteColor.withOpacity(0.5)
          : AppColors.saleColor.withOpacity(0.9),
      constraints: BoxConstraints.tightFor(
        height: height ?? 48,
        width: width ?? MediaQuery.of(context).size.width.clamp(240.0, 560.0),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: AppColors.blackColor,
            width: 1.5,
            style: outlined ? BorderStyle.solid : BorderStyle.none),
        borderRadius: UIHelper.bigBorderRadius,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: FittedBox(
          child: Row(
        children: [
          Visibility(
            visible: edit != null,
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                editIcon,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Text(
            width != null ? label : label.toUpperCase(),
            style: !outlined
                ? AppTextStyle.descrItemTextWhite
                : AppTextStyle.descrItemText,
          ),
        ],
      )),
    );
  }
}
