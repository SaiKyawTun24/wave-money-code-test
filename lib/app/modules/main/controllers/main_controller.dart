import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    pageController.jumpToPage(index);
    update();
  }

  void pageChange(int index) {
    selectedIndex.value = index;
    update();
  }
}
