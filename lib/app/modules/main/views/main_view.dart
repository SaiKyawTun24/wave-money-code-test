import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_money_code_test/app/modules/favorite/views/favorite_view.dart';
import 'package:wave_money_code_test/app/modules/home/views/home_view.dart';
import 'package:wave_money_code_test/app/modules/weekly_plan/views/weekly_plan_view.dart';
import 'package:wave_money_code_test/const/color/color.dart';
import '../../../../const/style/style.dart';
import '../../../../const/widget/bottom_nav_button.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: controller.pageChange,
            pageSnapping: false,
            children: [
              HomeView(),
              FavoriteView(),
              WeeklyPlanView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 20,
            selectedItemColor: AppColors.iconColor,
            currentIndex: controller.selectedIndex.value,
            backgroundColor:  AppColors.buttonBarColor,
            selectedLabelStyle: buttonTextStyle,
            type: BottomNavigationBarType.fixed,
            onTap: controller.onItemTapped,
            items: [
              bottomNavigationBarItem(
                  icon: Icons.home,
                  name: "Home",
                  isSelected: controller.selectedIndex.value == 0),
              bottomNavigationBarItem(
                  icon: Icons.favorite,
                  name: "Favorite",
                  isSelected: controller.selectedIndex.value == 1),
              bottomNavigationBarItem(
                  icon: Icons.date_range,
                  name: "Weekly",
                  isSelected: controller.selectedIndex.value == 2),
            ],
          ),
        ),
        ),
      );
  }
}
