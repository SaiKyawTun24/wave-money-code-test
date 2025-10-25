import 'package:flutter/material.dart';
import 'package:wave_money_code_test/app/data/model/recipes.dart';
import 'package:wave_money_code_test/app/data/repository/repository.dart';
import '../api_services/api_services.dart';
import '../local_storage/storage_constant.dart';
import '../local_storage/storage_manager.dart';
import '../local_storage/storage_manager_impl.dart';

class RepositoryImpl extends Repository {
  ApiService apiService = ApiService.create();
  final StorageManager storageManager = StorageManagerImpl();

  @override
  Future<RecipesResponse> getRecipes(
      bool includeNutrition, bool limitLicense, int number) {
    return apiService.getRecipes(includeNutrition, limitLicense, number);
  }

  @override
  Future<List<Recipe>> setAllObjects(List<Recipe> recipes) async {
    try {
      final Map<String, Recipe> recipeMap = {
        for (var recipe in recipes) recipe.id.toString(): recipe,
      };
      await storageManager.setAllObjects<Recipe>(recipesBox, recipeMap);
      return recipes;
    } catch (e) {
      debugPrint('Error saving recipes: $e');
      rethrow;
    }
  }

  @override
  Future<List<Recipe>> getAllHiveObjects() async {
    try {
      final recipes =
          await storageManager.getAllHiveObjects<Recipe>(recipesBox);
      return recipes;
    } catch (e) {
      debugPrint('Error fetching recipes from Hive: $e');
      return [];
    }
  }

  Future<void> setLastFetchedTime() async {
    await storageManager.setHiveObject<int>(
      recipesBox,
      recipesTimestampKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<int?> getLastFetchedTime() async {
    return await storageManager.getHiveObject<int>(
      recipesBox,
      recipesTimestampKey,
    );
  }

  @override
  Future<bool> shouldFetchNewData() async {
    final lastFetchedTime = await getLastFetchedTime();
    if (lastFetchedTime == null) {
      return true;
    }
    final now = DateTime.now().millisecondsSinceEpoch;
    // 30 minutes in milliseconds: 30 * 60 * 1000 = 1,800,000 ms
    const durationLimit = 1800000;
    final isStale = (now - lastFetchedTime) > durationLimit;

    return isStale;
  }

  Future<void> clearCache() async {
    try {
      await storageManager.clear(recipesBox);
    } catch (e) {
      debugPrint('Error clearing cache: $e');
    }
  }
}
