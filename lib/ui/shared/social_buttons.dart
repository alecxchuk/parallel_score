import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parallel_score/utils/constants/colors.dart';
import 'package:parallel_score/utils/constants/ui_helpers.dart';

class SocialButton extends StatelessWidget {
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final String iconName;
  const SocialButton({
    Key? key,
    required this.onPressed,
    required this.iconName,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
        elevation: 2,
        fillColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: UIHelper.bigBorderRadius),
        constraints: BoxConstraints.tightFor(
          height: height ?? 64,
          width: width ?? 92,
        ),
        child: getIcon());
  }

  Widget getIcon() {
    return SvgPicture.asset(
      iconName,
      height: 30,
    );
  }
}
