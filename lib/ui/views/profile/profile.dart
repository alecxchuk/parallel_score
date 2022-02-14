import 'package:flutter/material.dart';
import 'package:parallel_score/ui/shared/appBar/app_bars.dart';
import 'package:parallel_score/ui/shared/big_primary_button.dart';
import 'package:parallel_score/ui/shared/circle_avatar.dart';
import 'package:parallel_score/ui/views/profile/profile_vm.dart';
import 'package:parallel_score/utils/constants/app_constants.dart';
import 'package:parallel_score/utils/constants/colors.dart';
import 'package:parallel_score/utils/constants/text_styles.dart';
import 'package:parallel_score/utils/constants/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: const AconAppBar(
            bgColor: AppColors.whiteColor, headlineText: 'Profile'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const PhotoFrame(avatar: userAvatar, maxRadius: 80),
                UIHelper.verticalSpaceMedium,
                Text(
                  model.userName,
                  style: AppTextStyle.headline2,
                ),
                UIHelper.verticalSpaceMedium,
                Text(
                  model.userEmail,
                  style: AppTextStyle.headline2,
                ),
                UIHelper.verticalSpaceMedium,
                PrimaryButton(onPressed: model.logout, label: 'Logout')
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
