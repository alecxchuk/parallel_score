import 'package:flutter/material.dart';
import 'package:parallel_score/ui/shared/appBar/app_bars.dart';
import 'package:parallel_score/ui/shared/big_primary_button.dart';
import 'package:parallel_score/ui/shared/progress_indicator.dart';
import 'package:parallel_score/ui/shared/rectangular.dart';
import 'package:parallel_score/ui/shared/social_buttons.dart';
import 'package:parallel_score/ui/shared/textfield.dart';
import 'package:parallel_score/utils/constants/app_constants.dart';
import 'package:parallel_score/utils/constants/app_strings.dart';
import 'package:parallel_score/utils/constants/colors.dart';
import 'package:parallel_score/utils/constants/text_styles.dart';
import 'package:parallel_score/utils/constants/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signup_view.form.dart';
import 'signup_vm.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
  FormTextField(name: 'fullname')
])
class SignupView extends StatelessWidget with $SignupView {
  final appBarHeight = 170;

  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        appBar: AconAppBar(
          headlineText: signupText,
          bgColor: AppColors.backgroundColor,
          onBackPress: () {},
        ),
        body: model.isBusy
            ? const Center(child: CircularProgress())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: screenHeight(context) - appBarHeight,
                    child: Column(
                      children: [
                        UIHelper.customVerticalSpace(73),
                        CustomTextField(
                          label: nameText,
                          obscureText: false,
                          controller: fullnameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          onChanged: (input) {
                            model.checkName();
                          },
                        ),
                        UIHelper.verticalSpaceExtraSmall,
                        Visibility(
                          visible: model.nameErrorMessage.isNotEmpty &&
                              model.validateForm,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  model.nameErrorMessage,
                                  style: AppTextStyle.errorText,
                                ),
                              )),
                        ),
                        UIHelper.verticalSpaceSmall,
                        CustomTextField(
                          label: emailText,
                          obscureText: false,
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (input) {
                            model.checkEmail();
                          },
                        ),
                        UIHelper.verticalSpaceExtraSmall,
                        Visibility(
                          visible: model.emailErrorMessage.isNotEmpty &&
                              model.validateForm,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  model.emailErrorMessage,
                                  style: AppTextStyle.errorText,
                                ),
                              )),
                        ),
                        UIHelper.verticalSpaceSmall,
                        CustomTextField(
                          label: passwordText,
                          obscureText: true,
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (input) {
                            model.checkPassword();
                          },
                        ),
                        UIHelper.verticalSpaceExtraSmall,
                        Visibility(
                          visible: model.passwordErrorMessage.isNotEmpty &&
                              model.validateForm,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  model.passwordErrorMessage,
                                  style: AppTextStyle.errorText,
                                ),
                              )),
                        ),
                        UIHelper.verticalSpaceMedium,
                        GestureDetector(
                          onTap: () => model.nToLogin(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '$alreadyHaveAccount?',
                                style: AppTextStyle.descrItemText,
                              ),
                              UIHelper.horizontalSpaceExtraSmall,
                              const InkWell(
                                //onTap: () {},
                                child: Icon(
                                  longArrowRight,
                                  color: AppColors.saleColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        UIHelper.verticalSpaceLarge,
                        PrimaryButton(
                            onPressed: () => model.signup(),
                            label: signupText.toUpperCase(),
                            outlined: false,
                            active: true),
                        //UIHelper.verticalSpaceLarge,
                        const Spacer(),
                        Text(
                          loginSocialAccount,
                          style: AppTextStyle.descrItemText,
                        ),
                        UIHelper.customVerticalSpace(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialButton(
                                onPressed: () {}, iconName: googleIcon),
                            UIHelper.horizontalSpaceMedium,
                            SocialButton(
                                onPressed: () {}, iconName: facebookIcon)
                          ],
                        ),
                        UIHelper.customVerticalSpace(43),
                        const RectangleBar(
                          color: AppColors.realBlack,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
      viewModelBuilder: () => SignupViewModel(),
    );
  }
}
