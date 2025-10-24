import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_money_code_test/const/style/style.dart';
import 'package:wave_money_code_test/const/widget/image_widget.dart';
import '../../app/modules/weekly_plan/controllers/weekly_plan_controller.dart';

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
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            'Select Recipe for $day',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: Get.height * 0.6,
                  child: ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (ctx, index) {
                      final recipe = favorites[index];
                      return Card(
                        child: ListTile(
                          title: ImageWidget(image: recipe.image!),
                          subtitle: Text(
                            recipe.title!,
                            style: titleTextStyle,
                          ),
                          onTap: () => controller.addMealToPlan(day, recipe),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel'),
            ),
          ],
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
                  const Icon(Icons.calendar_month, color: Color(0xFFE94D33)),
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
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
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
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.red),
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
                    icon: const Icon(Icons.add, color: Colors.green),
                    label: Text(
                      hasPlan ? 'Change Recipe' : 'Add Recipe',
                      style: const TextStyle(color: Colors.green),
                    ),
                    onPressed: _showRecipeSelectionDialog,
                  ),
                  if (hasPlan)
                    TextButton.icon(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      label: const Text(
                        'Clear Day',
                        style: TextStyle(color: Colors.red),
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
