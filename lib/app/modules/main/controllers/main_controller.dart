import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_money_code_test/app/modules/home/controllers/home_controller.dart';
import '../../favorite/controllers/favorite_controller.dart';
import '../../weekly_plan/controllers/weekly_plan_controller.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(
      initialPage: selectedIndex.value,
      keepPage: true,
    );
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;

    switch (index) {
      case 0:
        final homeCtrl = Get.put(HomeController(), permanent: true);
        homeCtrl.loadFromCache(showError: false);
        break;

      case 1:
        final favCtrl = Get.put(FavoriteController(), permanent: true);
        favCtrl.loadFavorites();
        break;

      case 2:
        final weeklyCtrl = Get.put(WeeklyPlanController(), permanent: true);
        weeklyCtrl.refreshWeekly();
        break;
    }
    pageController.jumpToPage(index);
  }

  void pageChange(int index) {
    selectedIndex.value = index;
  }
}
