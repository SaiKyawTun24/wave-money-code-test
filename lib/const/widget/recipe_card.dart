import 'package:flutter/material.dart';
import '../../app/data/model/recipes.dart';
import '../style/style.dart';
import 'image_widget.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe, this.onTap});

  final Recipe recipe;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: ImageWidget(image: recipe.image!),
        subtitle: Text(
          recipe.title!,
          style: titleTextStyle,
        ),
        onTap: onTap,
        //onTap: () => controller.addMealToPlan(day, recipe),
      ),
    );
  }
}
