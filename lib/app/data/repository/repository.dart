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
}
