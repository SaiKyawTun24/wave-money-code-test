import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../const/widget/grid_widget.dart';
import '../../../../const/widget/loading.dart';
import '../../../../const/widget/my_text_field.dart';
import '../../../data/model/recipes.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: MyTextField(onChanged: controller.onSearch),
          ),
          body: controller.recipeResult!.isNotEmpty ? GridWidget(
            recipes: controller.recipeResult!,
            onToggleFavorite: (Recipe recipe) => controller.isFavorite(recipe),
          ) : Loading(),
        );
      }),
    );
  }
}
