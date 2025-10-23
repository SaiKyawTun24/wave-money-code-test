import 'package:get/get.dart';
import 'package:wave_money_code_test/app/data/model/recipes.dart';
import 'package:wave_money_code_test/base/base_controller.dart';

class RecipeDetailController extends BaseController {
  late Recipe recipe;

  @override
  void onInit() {
    recipe = Get.arguments;
    super.onInit();
  }

  isFavorite(Recipe recipe) async {
    await toggleFavorite(recipe);
  }
}
