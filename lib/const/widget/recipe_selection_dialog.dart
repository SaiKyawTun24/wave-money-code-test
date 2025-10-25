import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_money_code_test/const/widget/recipe_card.dart';
import '../../app/data/model/recipes.dart';

class RecipeSelectionDialog extends StatelessWidget {
  const RecipeSelectionDialog(
      {super.key,
      required this.day,
      required this.recipes,
      required this.onSelected});

  final String day;
  final List<Recipe> recipes;
  final Function(Recipe, String day) onSelected;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text('Select Recipe for $day',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      content: SizedBox(
        width: double.maxFinite,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (ctx, index) {
              final recipe = recipes[index];
              return RecipeCard(
                recipe: recipe,
                onTap: () {
                  onSelected(recipe, day);
                  Get.back();
                },
              );
            },
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
