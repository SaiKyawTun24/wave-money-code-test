import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../const/color/color.dart';
import '../../../../const/widget/grid_widget.dart';
import '../../../../const/widget/loading.dart';
import '../../../../const/widget/my_text_field.dart';
import '../../../data/model/recipes.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.buttonBarColor,
            title: MyTextField(onChanged: controller.onSearch),
          ),
          body: controller.recipeResult!.isNotEmpty
              ? GridWidget(
                  recipes: controller.recipeResult!,
                  onToggleFavorite: (Recipe recipe) =>
                      controller.isFavorite(recipe),
                )
              : Loading(),
        ),
      ),
    );
  }
}
