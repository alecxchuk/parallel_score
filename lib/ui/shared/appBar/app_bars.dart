import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parallel_score/utils/constants/app_constants.dart';
import 'package:parallel_score/utils/constants/colors.dart';
import 'package:parallel_score/utils/constants/text_styles.dart';

class AconAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? headlineText;
  final String? centerTitle;
  final Color bgColor;
  final Color? shadowColor;
  final Function? onBackPress;
  final double elevation;

  const AconAppBar({
    Key? key,
    required this.bgColor,
    this.onBackPress,
    this.shadowColor,
    this.headlineText,
    this.centerTitle,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: bgColor,
      shadowColor: shadowColor ?? AppColors.blackColor.withOpacity(0.08),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: bgColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
      elevation: elevation,
      centerTitle: true,
      title: centerTitle != null
          ? Text(
              centerTitle!,
              textAlign: TextAlign.start,
              style: AppTextStyle.headline3,
            )
          : null,
      bottom: headlineText != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(68),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 4, top: 34),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    headlineText ?? '',
                    textAlign: TextAlign.start,
                    style: AppTextStyle.headline,
                  ),
                ),
              ),
            )
          : null,
      automaticallyImplyLeading: true,
      leading: onBackPress != null
          ? InkWell(
              child: const Icon(
                backIcon,
                color: AppColors.blackColor,
                size: 24,
              ),
              onTap: () => onBackPress!(),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(headlineText != null ? 120 : 44);
}
