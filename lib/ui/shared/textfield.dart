import 'package:flutter/material.dart';
import 'package:parallel_score/utils/constants/colors.dart';
import 'package:parallel_score/utils/constants/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? label;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? error;
  final String? errorMessage;
  final bool obscureText;
  final dynamic onChanged;
  final double height;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final BoxConstraints? suffixIconConstraints;
  const CustomTextField(
      {Key? key,
      this.label,
      this.obscureText = false,
      required this.onChanged,
      this.hintText,
      this.suffixIcon,
      this.error,
      this.errorMessage,
      this.controller,
      this.textInputAction,
      this.height = 64,
      this.maxLines,
      this.keyboardType,
      this.contentPadding,
      this.suffixIconConstraints})
      : super(key: key);
  // final double contentPadding = 20.0;
  final double borderRadius = 4.0;
  // final  double textfieldHeight = 64.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        boxShadow: [
          BoxShadow(
              color: AppColors.realBlack.withOpacity(0.05),
              offset: const Offset(0, 1),
              blurRadius: 8)
        ],
        color: AppColors.whiteColor,
      ),
      child: Center(
        child: TextField(
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            controller: controller!,
            onChanged: (x) => onChanged(x),
            // validator: validate,
            style: maxLines == null
                ? AppTextStyle.textFieldInput.copyWith(height: 1.5)
                : AppTextStyle.normalText14Black.copyWith(height: 1.5),
            obscureText: obscureText,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
                labelText: label,
                hintText: hintText,
                hintStyle: AppTextStyle.helperText14,
                labelStyle: AppTextStyle.helperText14,
                contentPadding: contentPadding ??
                    EdgeInsets.symmetric(
                        horizontal: 20, vertical: maxLines != null ? 12 : 0),
                suffixIcon: suffixIcon,
                suffixIconConstraints: suffixIconConstraints,
                border: InputBorder.none,
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.errorColor,
                  ),
                ))),
      ),
    );
  }
}
