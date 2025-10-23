import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_money_code_test/base/base_controller.dart';

import '../../../data/model/recipes.dart';

class FavoriteController extends BaseController {
  final _favoriteResult = <Recipe>[].obs;

  List<Recipe>? get favoriteResult => _favoriteResult.toList();

  setFavoriteResult(value) {
    _favoriteResult.value = value;
  }

  @override
  void onInit() {
    loadFavorites();
    super.onInit();
  }

  Future<void> loadFavorites() async {
    try {
      final favorites = await getFavorites();
      setFavoriteResult(favorites);
      update();
      debugPrint('Successfully loaded ${favorites.length} favorite recipes.');
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }

  isFavorite(Recipe recipe) async {
    await toggleFavorite(recipe);
    await loadFavorites();
  }
}
