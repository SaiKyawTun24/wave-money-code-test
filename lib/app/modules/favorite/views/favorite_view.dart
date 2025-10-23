import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../const/widget/grid_widget.dart';
import '../../../data/model/recipes.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(builder: (controller){
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Favorites'),
          centerTitle: true,
        ),
        body:  controller.favoriteResult!.isNotEmpty ? GridWidget(
          recipes: controller.favoriteResult!,
          onToggleFavorite: (Recipe recipe) => controller.isFavorite(recipe),
        ) : Center(child: Text('Empty Favorites')),
      );
    });
  }
}
