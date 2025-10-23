import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../app/data/model/extended_ingredients.dart';
import '../style/style.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({super.key, required this.ingredients});

  final List<ExtendedIngredients> ingredients;

  @override
  Widget build(BuildContext context) {
    if (ingredients.isEmpty) {
      return const Center(child: Text('No ingredients listed.'));
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = ingredients[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: ingredient.image != null
                  ? CachedNetworkImage(
                      imageUrl:
                          "${dotenv.env['ImageUrlBase']}${ingredient.image}",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                              child:
                                  CircularProgressIndicator(strokeWidth: 2))),
                      errorWidget: (context, url, error) => const Icon(
                          Icons.shopping_basket,
                          size: 30,
                          color: Colors.grey),
                    )
                  : const Icon(Icons.shopping_basket,
                      size: 30, color: Colors.grey),
            ),
            title: Text(
              ingredient.name ?? 'Unnamed Ingredient',
              style: titleTextStyle,
            ),
            subtitle: Text(
              ingredient.original ??
                  '${ingredient.amount ?? ''} ${ingredient.unit ?? ''}',
              style: subtitleTextStyle,
            ),
            trailing: Text(
              ingredient.aisle?.split(';').first ?? '',
              style: subtitleTextStyle,
            ),
          ),
        );
      },
    );
  }
}
