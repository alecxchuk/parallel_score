import 'package:flutter/material.dart';
import 'package:parallel_score/app/app.locator.dart';
import 'package:parallel_score/models/users.dart';
import 'package:parallel_score/services/user_service.dart';
import 'package:parallel_score/ui/shared/appBar/app_bars.dart';
import 'package:parallel_score/ui/shared/progress_indicator.dart';
import 'package:parallel_score/ui/views/add_users/add_users_vm.dart';
import 'package:parallel_score/utils/constants/colors.dart';
import 'package:parallel_score/utils/constants/text_styles.dart';
import 'package:parallel_score/utils/constants/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class AddUsers extends StatelessWidget {
  const AddUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddUsersModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: const AconAppBar(
          bgColor: AppColors.whiteColor,
          centerTitle: 'Add a user',
        ),
        body: model.isBusy
            ? const Center(child: CircularProgress())
            : StreamBuilder(
                stream: locator<UserService>().getStream(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) return const CircularProgress();
                  var snap = snapshot.data?.docs;
                  snap.removeWhere((item) =>
                      User.fromSnapshot(item).userId == model.currentUserId);
                  return Container(
                    padding: UIHelper.customSymmetricPadding(
                        horizontal: 16, vertical: 16),
                    child: snap.length == 0
                        ? const Center(
                            child: Text('No users to add'),
                          )
                        : ListView.separated(
                            itemCount: snap.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => model.addUserToChat(
                                    User.fromSnapshot(snap[index])),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          User.fromSnapshot(snap[index])
                                              .avatarUrl),
                                      maxRadius: 30,
                                    ),
                                    UIHelper.horizontalSpaceLarge,
                                    Text(
                                      User.fromSnapshot(snap[index]).name,
                                      style: AppTextStyle.normalText16Black,
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return UIHelper.verticalSpaceMedium;
                            },
                          ),
                  );
                },
              ),
      ),
      viewModelBuilder: () => AddUsersModel(),
    );
  }
}
