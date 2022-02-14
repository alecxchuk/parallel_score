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
import 'package:parallel_score/utils/mixins/validators_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';
import 'login_vm.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView, ValidatorMixin {
  final appBarHeight = 170;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginVm>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        appBar: AconAppBar(
          headlineText: loginText,
          bgColor: AppColors.backgroundColor,
          onBackPress: model.nToSignup,
        ),
        body: model.isBusy
            ? const Center(child: CircularProgress())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: SingleChildScrollView(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: SizedBox(
                      height: screenHeight(context) - appBarHeight,
                      child: Column(
                        children: [
                          UIHelper.customVerticalSpace(73),
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
                            visible: model.msg.isNotEmpty && model.validateForm,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    model.msg,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    model.passwordErrorMessage,
                                    style: AppTextStyle.errorText,
                                  ),
                                )),
                          ),
                          UIHelper.verticalSpaceMedium,
                          GestureDetector(
                            onTap: () => model.nToForgotPassword(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '$forgotYourPasswordText?',
                                  style: AppTextStyle.descrItemText,
                                ),
                                UIHelper.horizontalSpaceExtraSmall,
                                const InkWell(
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
                              onPressed: () => model.login(),
                              label: loginText.toUpperCase(),
                              outlined: false,
                              active: true),
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
      ),
      viewModelBuilder: () => LoginVm(),
    );
  }
}
