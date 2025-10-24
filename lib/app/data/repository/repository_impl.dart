import 'package:flutter/material.dart';
import 'package:wave_money_code_test/app/data/model/meal_plan.dart';
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

  @override
  Future<List<WeeklyMealPlan>> getAllWeeklyMealPlan() async {
    try {
      final weeklyPlan =
      await storageManager.getAllHiveObjects<WeeklyMealPlan>(mealPlanBoxName);
      return weeklyPlan;
    } catch (e) {
      debugPrint('Error fetching weekly meal plan: $e');
      return [];
    }
  }

  @override
  Future<List<WeeklyMealPlan>> setWeeklyMealPlan(
      List<WeeklyMealPlan> weeklyMealPlan) async {
    try {
      for (var plan in weeklyMealPlan) {
        final key = '${plan.day}_${plan.recipe.id}';
        await storageManager.setHiveObject<WeeklyMealPlan>(
          mealPlanBoxName,
          key,
          plan,
        );
      }
      return weeklyMealPlan;
    } catch (e) {
      debugPrint('Error setting weekly meal plan: $e');
      rethrow;
    }
  }

  @override
  Future<void> removeWeeklyPlanEntry(String day, int recipeId) async {
    try {
      final key = '${day}_$recipeId';
      await storageManager.remove(mealPlanBoxName, key);
      debugPrint('Removed meal plan entry for $day - recipe $recipeId.');
    } catch (e) {
      debugPrint('Error removing weekly meal plan entry for $day: $e');
      rethrow;
    }
  }

  @override
  Future<void> clearDay(String day) async {
    try {
      await (storageManager as StorageManagerImpl)
          .removeByPrefix(mealPlanBoxName, day);
      debugPrint('Cleared all recipes for $day.');
    } catch (e) {
      debugPrint('Error clearing day $day: $e');
      rethrow;
    }
  }

  @override
  Future<void> clearWeeklyPlan() async {
    try {
      await storageManager.clear(mealPlanBoxName);
      debugPrint('Cleared entire weekly meal plan.');
    } catch (e) {
      debugPrint('Error clearing weekly plan: $e');
      rethrow;
    }
  }
}
