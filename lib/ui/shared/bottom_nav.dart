import 'package:flutter/material.dart';
import 'package:parallel_score/ui/shared/rectangular.dart';
import 'package:parallel_score/utils/constants/colors.dart';
import 'package:parallel_score/utils/constants/ui_helpers.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) setIndex;
  const BottomNav(
      {Key? key, required this.currentIndex, required this.setIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: setIndex,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey.shade600,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w600),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: "Chats",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group_work),
                  label: "Channels",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),
                  label: "Profile",
                ),
              ],
            ),
          ),
          UIHelper.customVerticalSpace(10),
          const RectangleBar(
            color: AppColors.blackColor,
          ),
          UIHelper.customVerticalSpace(8),
        ],
      ),
    );
  }
}
