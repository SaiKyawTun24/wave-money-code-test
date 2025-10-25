import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../const/color/color.dart';
import '../../../../const/style/style.dart';
import '../../../../const/widget/image_widget.dart';
import '../../../../const/widget/ingredient_widget.dart';
import '../../../../const/widget/instructions_widget.dart';
import '../../../../const/widget/nutrition_widget.dart';
import '../controllers/recipe_detail_controller.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecipeDetailController>(builder: (controller) {
      var recipe = controller.recipe;
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.buttonBarColor,
            title: Text(
              recipe.title! ?? 'Recipe Detail',
              style: appBarTextStyle,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageWidget(image: recipe.image!),
                  Text(
                    recipe.title!,
                    overflow: TextOverflow.ellipsis,
                    style: titleTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ready in ${recipe.readyInMinutes ?? 0} min',
                        overflow: TextOverflow.ellipsis,
                        style: subtitleTextStyle,
                      ),
                      Icon(
                        Icons.favorite,
                        color: recipe.isFavorite == true
                            ? AppColors.redColor
                            : AppColors.subtitleTextColor,
                      ),
                    ],
                  ),
                  IngredientWidget(ingredients: recipe.extendedIngredients!),
                  InstructionsHtmlWidget(
                    instructionsHtml: recipe.instructions!,
                    title: 'Instructions',
                  ),
                  InstructionsHtmlWidget(
                    instructionsHtml: recipe.summary!,
                    title: 'Summary',
                  ),
                  NutritionWidget(nutrients: recipe.nutrition!.nutrients!),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
