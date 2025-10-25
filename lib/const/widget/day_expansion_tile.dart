import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_money_code_test/const/style/style.dart';
import 'package:wave_money_code_test/const/widget/image_widget.dart';
import 'package:wave_money_code_test/const/widget/recipe_selection_dialog.dart';
import '../../app/modules/weekly_plan/controllers/weekly_plan_controller.dart';
import '../color/color.dart';

class DayExpansionTile extends StatelessWidget {
  final String day;
  final WeeklyPlanController controller;

  const DayExpansionTile({
    super.key,
    required this.day,
    required this.controller,
  });

  void _showRecipeSelectionDialog() {
    final favorites = controller.favoriteResult;
    if (favorites == null || favorites.isEmpty) {
      Get.snackbar(
        'No Favorites Found',
        'Please save some recipes as favorites first.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    showDialog(
      context: Get.context!,
      builder: (ctx) {
        return RecipeSelectionDialog(
          day: day,
          recipes: favorites,
          onSelected: (recipe, day) => controller.addMealToPlan(day, recipe),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final mealsForDay = controller.getMealsForDay(day);
      final hasPlan = mealsForDay.isNotEmpty;
      final mealCount = mealsForDay.length;

      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        child: ExpansionTile(
          initiallyExpanded: controller.isExpanded.value,
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_month, color: AppColors.redColor),
                  const SizedBox(width: 12),
                  Text(
                    day,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Text(
                '$mealCount recipe${mealCount != 1 ? 's' : ''}',
                style: subtitleTextStyle,
              ),
            ],
          ),
          children: [
            if (hasPlan)
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: Get.height * 0.6,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: mealsForDay.length,
                  itemBuilder: (ctx, index) {
                    final meal = mealsForDay[index];
                    final recipe = meal.recipe;
                    return Card(
                      child: ListTile(
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: ImageWidget(image: recipe.image!),
                        ),
                        title: Text(recipe.title!),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_outline,
                            color: AppColors.redColor,
                          ),
                          onPressed: () =>
                              controller.removeMealFromPlan(day, recipe),
                        ),
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    icon: Icon(Icons.add, color: AppColors.greenColor),
                    label: Text(
                      hasPlan ? 'Change Recipe' : 'Add Recipe',
                      style: addRecipeTextStyle,
                    ),
                    onPressed: _showRecipeSelectionDialog,
                  ),
                  if (hasPlan)
                    TextButton.icon(
                      icon:
                          Icon(Icons.delete_outline, color: AppColors.redColor),
                      label: Text(
                        'Clear Day',
                        style: clearTextStyle,
                      ),
                      onPressed: () => controller.removeMealsFromDay(day),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
