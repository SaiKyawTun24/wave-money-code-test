import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_money_code_test/base/base_controller.dart';
import '../../../data/local_storage/storage_constant.dart';
import '../../../data/model/meal_plan.dart';
import '../../../data/model/recipes.dart';

class WeeklyPlanController extends BaseController {
  final _favoriteResult = <Recipe>[].obs;

  List<Recipe>? get favoriteResult => _favoriteResult.toList();

  setFavoriteResult(value) {
    _favoriteResult.value = value;
  }

  final _weeklyPlan = <WeeklyMealPlan>[].obs;

  List<WeeklyMealPlan>? get weeklyPlan => _weeklyPlan.toList();

  setWeeklyPlan(value) {
    _weeklyPlan.value = value;
  }

  final _errorMessage = ''.obs;

  String get errorMessage => _errorMessage.value;

  var isExpanded = false.obs;

  final List<String> days = const [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  void onInit() {
    loadFavorites();
    fetchWeeklyPlan();
    super.onInit();
  }

  Future<void> loadFavorites() async {
    try {
      final favorites = await getFavorites();
      setFavoriteResult(favorites);
      update();
      debugPrint('Successfully loaded ${favorites.length} favorite recipes.');
    } catch (e) {
      _errorMessage.value = 'Failed to load favorite recipes.';
      debugPrint('Error loading favorites: $e');
    }
  }

  Future<void> fetchWeeklyPlan() async {
    try {
      final result = await storageManager.getAllHiveObjects<WeeklyMealPlan>(mealPlanBoxName);
      setWeeklyPlan(result);
    } catch (e) {
      _errorMessage.value = 'Failed to load weekly plan.';
      debugPrint('Error fetching weekly plan: $e');
    }
  }

  String generateKey(String day, Recipe recipe) {
    return '${day.toLowerCase()}_${recipe.id}';
  }

  // Add a meal to a day
  Future<void> addMealToPlan(String day, Recipe recipe) async {
    final key = generateKey(day, recipe);
    final mealPlan = WeeklyMealPlan(day: day, recipe: recipe);
    await storageManager.setHiveObject<WeeklyMealPlan>(mealPlanBoxName, key, mealPlan);
    await fetchWeeklyPlan();
    Get.back();
  }

  // Remove a specific meal from a day
  Future<void> removeMealFromPlan(String day, Recipe recipe) async {
    final key = generateKey(day, recipe);
    await storageManager.remove(mealPlanBoxName, key);
    await fetchWeeklyPlan();
  }

  // Remove all meals for a specific day
  Future<void> removeMealsFromDay(String day) async {
    final allMeals = await storageManager.getAllHiveObjects<WeeklyMealPlan>(mealPlanBoxName);
    for (var meal in allMeals) {
      if (meal.day == day) {
        final key = generateKey(day, meal.recipe);
        await storageManager.remove(mealPlanBoxName, key);
      }
    }
    await fetchWeeklyPlan();
  }

  // Clear all meal plans
  Future<void> clearAllWeeklyPlan() async {
    await storageManager.clear(mealPlanBoxName);
    await fetchWeeklyPlan();
  }

  // Check if a day has any meals
  bool hasMeals(String day) {
    return _weeklyPlan.any((meal) => meal.day == day);
  }

  // Get meals for a specific day
  List<WeeklyMealPlan> getMealsForDay(String day) {
    return _weeklyPlan.where((meal) => meal.day == day).toList();
  }
}
