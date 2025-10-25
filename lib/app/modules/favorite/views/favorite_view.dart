import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_money_code_test/const/style/style.dart';
import '../../../../const/color/color.dart';
import '../../../../const/widget/grid_widget.dart';
import '../../../data/model/recipes.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.buttonBarColor,
            title: Text(
              'My Favorites',
              style: appBarTextStyle,
            ),
            centerTitle: true,
          ),
          body: controller.favoriteResult!.isNotEmpty
              ? GridWidget(
                  recipes: controller.favoriteResult!,
                  onToggleFavorite: (Recipe recipe) =>
                      controller.isFavorite(recipe),
                )
              : Center(
                  child: Text(
                    'Empty Favorites',
                    style: titleTextStyle,
                  ),
                ),
        ),
      ),
    );
  }
}
