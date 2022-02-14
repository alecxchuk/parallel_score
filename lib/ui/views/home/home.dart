import 'package:flutter/material.dart';
import 'package:parallel_score/app/app.locator.dart';
import 'package:parallel_score/ui/shared/bottom_nav.dart';
import 'package:parallel_score/ui/views/chat_page/chat_page.dart';
import 'package:parallel_score/ui/views/profile/profile.dart';
import 'package:stacked/stacked.dart';

import 'home_vm.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
          bottomNavigationBar: BottomNav(
              currentIndex: model.currentIndex, setIndex: model.setIndex),
          body: getViewForIndex(model.currentIndex)),
      viewModelBuilder: () => locator<HomeViewModel>(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const ChatPageView();
      case 1:
        return const ChatPageView();
      default:
        return const ProfileView();
    }
  }
}
