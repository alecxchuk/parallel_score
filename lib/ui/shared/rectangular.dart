import 'package:flutter/material.dart';
import 'package:parallel_score/utils/constants/colors.dart';

class RectangleBar extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  const RectangleBar({Key? key, this.height, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? 134,
        height: height ?? 5,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(3),
          ),
          color: color ?? AppColors.appGrey,
        ));
  }
}
