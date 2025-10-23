import 'package:get/get.dart';

import '../modules/favorite/bindings/favorite_binding.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/recipe_detail/bindings/recipe_detail_binding.dart';
import '../modules/recipe_detail/views/recipe_detail_view.dart';
import '../modules/weekly_plan/bindings/weekly_plan_binding.dart';
import '../modules/weekly_plan/views/weekly_plan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.RECIPE_DETAIL,
      page: () => const RecipeDetailView(),
      binding: RecipeDetailBinding(),
    ),
    GetPage(
      name: _Paths.WEEKLY_PLAN,
      page: () => const WeeklyPlanView(),
      binding: WeeklyPlanBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
  ];
}
