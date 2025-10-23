import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_money_code_test/app/modules/favorite/views/favorite_view.dart';
import 'package:wave_money_code_test/app/modules/home/views/home_view.dart';
import 'package:wave_money_code_test/app/modules/weekly_plan/views/weekly_plan_view.dart';
import '../../../../const/widget/bottom_nav_button.dart';
import '../controllers/main_controller.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (MainController controller) {
        return SafeArea(
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
            bottomNavigationBar: BottomAppBar(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavButton(
                    icon: Icons.home,
                    label: 'Home',
                    isSelected: controller.selectedIndex.value == 0,
                    onTap: () => controller.onItemTapped(0),
                  ),
                  BottomNavButton(
                    icon: Icons.favorite,
                    label: 'Favorite',
                    isSelected: controller.selectedIndex.value == 1,
                    onTap: () => controller.onItemTapped(1),
                  ),
                  BottomNavButton(
                    icon: Icons.date_range,
                    label: 'Weekly',
                    isSelected: controller.selectedIndex.value == 2,
                    onTap: () => controller.onItemTapped(2),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
