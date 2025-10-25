import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wave_money_code_test/base/base_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../data/model/recipes.dart';
import '../../../data/repository/repository_impl.dart';

class HomeController extends BaseController {
  final Connectivity _connectivity = Connectivity();

  final _recipeResult = <Recipe>[].obs;

  List<Recipe>? get recipeResult => _recipeResult.toList();

  setRecipeResult(value) {
    _recipeResult.value = value;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    final shouldFetch = await repository.shouldFetchNewData();
    if (shouldFetch) {
      if (repository is RepositoryImpl) {
        await (repository as RepositoryImpl).clearCache();
      }
      if (await isOnline) {
        getRecipes();
      } else {
        loadFromCache(showError: true);
      }
    } else {
      loadFromCache(showError: false);
    }
  }

  onSearch(String ingredient) {
    final queryLower = ingredient.toLowerCase().trim();
    debugPrint('Applying filter for ingredient: "$ingredient"');
    final filteredRecipes = recipeResult!.where((recipe) {
      return recipe.extendedIngredients?.any((extIngredient) {
            final ingredientName = extIngredient.name?.toLowerCase() ?? '';
            return ingredientName.contains(queryLower);
          }) ??
          false;
    }).toList();
    if (filteredRecipes.isNotEmpty) {
      setRecipeResult(filteredRecipes);
    } else {
      debugPrint("Empty array");
      loadFromCache(showError: false);
    }
    update();
  }

  void loadFromCache({required bool showError}) async {
    final cachedRecipes = await repository.getAllHiveObjects();
    debugPrint("Load Local data");
    if (cachedRecipes.isNotEmpty) {
      setRecipeResult(cachedRecipes);
      if (showError) {
        EasyLoading.showToast(
            "Using cached data. Please check connection for updates.");
      }
    } else if (showError) {
      EasyLoading.showError("No internet and no cached data.");
    }
    update();
  }

  Future<bool> get isOnline async {
    final result = await _connectivity.checkConnectivity();
    debugPrint("Connection: $result");
    if (result == ConnectivityResult.none) {
      return false;
    }
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint("Real Internet Access: True");
        return true;
      }
      debugPrint("Real Internet Access: False (Lookup failed)");
      return false;
    } on SocketException catch (_) {
      debugPrint("Real Internet Access: False (Socket Exception)");
      return false;
    }
  }

  void loadFromCacheAndShowError() async {
    final cachedRecipes = await repository.getAllHiveObjects();

    if (cachedRecipes.isNotEmpty) {
      setRecipeResult(cachedRecipes);
      update();
    } else {
      EasyLoading.showError("No internet and no cached data.");
    }
  }

  getRecipes() {
    callDataService(
      repository.getRecipes(true, true, 50),
      onSuccess: handleRecipesResponse,
      onError: (e) {
        EasyLoading.showError(e.message);
      },
    );
  }

  handleRecipesResponse(RecipesResponse response) async {
    if (response.recipes!.isNotEmpty) {
      repository.setAllObjects(response.recipes!);
      await (repository as RepositoryImpl).setLastFetchedTime();
      setRecipeResult(response.recipes);
      update();
    } else {
      EasyLoading.showError("Error");
    }
  }

  void isFavorite(Recipe recipe) async {
    _recipeResult.value = _recipeResult.map((r) {
      if (r.id == recipe.id) {
        return r.copyWith(isFavorite: !r.isFavorite);
      }
      return r;
    }).toList();
    update();
    await toggleFavorite(recipe);
  }
}
