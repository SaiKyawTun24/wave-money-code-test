import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../app/data/local_storage/storage_constant.dart';
import '../app/data/local_storage/storage_manager.dart';
import '../app/data/local_storage/storage_manager_impl.dart';
import '../app/data/model/recipes.dart';
import '../app/data/repository/repository.dart';
import 'error_handle.dart';


abstract class BaseController extends GetxController {
  final Repository repository = Get.find(tag: (Repository).toString());
  final StorageManager storageManager = StorageManagerImpl();
  var isLoading = false.obs;

  dynamic callDataService<T>(
      Future<T> future, {
        Function(MyDioException exception)? onError,
        Function(T response)? onSuccess,
        Function? onStart,
        Function? onComplete,
      }) async {
    MyDioException? exception;

    onStart == null ? isLoading.value = false : onStart();

    try {
      final T response = await future;
      if (onSuccess != null) onSuccess(response);
      return response;
    } catch (e, stacktrace) {
      debugPrint("Stacktrace : $stacktrace");

      if (e is DioException) {
        exception = handleDioError(e);
      } else {
        exception = MyDioException(
          message: 'Please connect again',
          statusCode: 404,
        );
      }
    } finally {
      // Call the onComplete function if provided
      if (onComplete != null) onComplete();
      isLoading.value = true;

      // Handle error with EasyLoading and call onError if provided
      if (onError != null && exception != null) {
        _handleError(exception);
        onError(exception);
      }
    }
  }

  void _handleError(MyDioException exception) {
    EasyLoading.showError(exception.message);
    EasyLoading.dismiss();
  }

  Future<void> toggleFavorite(Recipe recipe) async {
    final key = recipe.id.toString();
    final isCurrentlyFavorite = await storageManager.getHiveObject<Recipe>(favoritesBox, key) != null;
    if (isCurrentlyFavorite) {

      await storageManager.remove(favoritesBox, key);
      debugPrint('Removed ${recipe.title} from favorites.');
    } else {
      final favoriteRecipe = recipe.copyWith(isFavorite: true);
      await storageManager.setHiveObject<Recipe>(favoritesBox, key, favoriteRecipe);
      debugPrint('Added ${recipe.title} to favorites.');
    }
    await _updateMainCacheStatus(recipe.id!, !isCurrentlyFavorite);
  }

  Future<void> _updateMainCacheStatus(int recipeId, bool isFavorite) async {
    final key = recipeId.toString();
    final cachedRecipe = await storageManager.getHiveObject<Recipe>(recipesBox, key);

    if (cachedRecipe != null) {
      final updatedRecipe = cachedRecipe.copyWith(isFavorite: isFavorite);
      await storageManager.setHiveObject<Recipe>(recipesBox, key, updatedRecipe);
    }
  }

  Future<List<Recipe>> getFavorites() async {
    return await storageManager.getAllHiveObjects<Recipe>(favoritesBox);
  }
}
