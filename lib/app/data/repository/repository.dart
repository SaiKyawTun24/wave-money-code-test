import '../model/meal_plan.dart';
import '../model/recipes.dart';

abstract class Repository {
  Future<RecipesResponse> getRecipes(
    bool includeNutrition,
    bool limitLicense,
    int number,
  );
  Future<List<Recipe>> setAllObjects(List<Recipe> recipes);
  Future<List<Recipe>> getAllHiveObjects();
  Future<bool> shouldFetchNewData();
  Future<List<WeeklyMealPlan>> setWeeklyMealPlan(
      List<WeeklyMealPlan> weeklyMealPlan);
  Future<List<WeeklyMealPlan>> getAllWeeklyMealPlan();

  Future<void> removeWeeklyPlanEntry(String day, int recipeId);
  Future<void> clearDay(String day);
  Future<void> clearWeeklyPlan();
}
