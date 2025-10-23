import 'package:flutter/material.dart';
import '../../app/data/model/recipes.dart';
import '../style/style.dart';
import 'image_widget.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
    required this.recipes,
    required this.onToggleFavorite,
  });

  final List<Recipe> recipes;
  final void Function(Recipe recipe) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: recipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns for the grid
        crossAxisSpacing: 12.0, // Horizontal space between items
        mainAxisSpacing: 12.0, // Vertical space between items
        childAspectRatio: 1 / 1.2,
      ),
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: InkWell(
                onTap: () {},
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ImageWidget(image: recipe.image!),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            recipe.title ?? 'Unknown Recipe',
                            overflow: TextOverflow.ellipsis,
                            style: titleTextStyle,
                          ),
                          Text(
                            'Ready in ${recipe.readyInMinutes ?? 0} min',
                            style: subtitleTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: IconButton(
                onPressed:  () => onToggleFavorite(recipe),
                icon: Icon(
                  Icons.favorite,
                  color: recipe.isFavorite == true ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
