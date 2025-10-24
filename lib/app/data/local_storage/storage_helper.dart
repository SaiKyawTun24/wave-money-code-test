import 'package:hive_flutter/hive_flutter.dart';
import 'package:wave_money_code_test/app/data/local_storage/storage_constant.dart';

import '../model/analyzed_instructions.dart';
import '../model/extended_ingredients.dart';
import '../model/meal_plan.dart';
import '../model/nutrition.dart';
import '../model/recipes.dart';

class StorageHelper {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RecipesResponseAdapter());
    Hive.registerAdapter(RecipeAdapter());
    Hive.registerAdapter(ExtendedIngredientsAdapter());
    Hive.registerAdapter(NutritionAdapter());
    Hive.registerAdapter(NutrientsAdapter());
    Hive.registerAdapter(WeeklyMealPlanAdapter());
    Hive.registerAdapter(AnalyzedInstructionsAdapter());
    Hive.registerAdapter(StepsAdapter());
    await _openBoxes();
  }

  static Future<void> _openBoxes() async {
    await Hive.openBox<dynamic>(recipesBox);
    await Hive.openBox<dynamic>(recipesTimestampKey);
    await Hive.openBox<dynamic>(mealPlanBoxName);
  }

  static Future<void> dispose() async {
    await Hive.close();
  }
}
