import 'package:get/get.dart';
import 'package:wave_money_code_test/app/modules/weekly_plan/controllers/weekly_plan_controller.dart';
import '../../favorite/controllers/favorite_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<HomeController>(HomeController());
    Get.put<FavoriteController>(FavoriteController());
    Get.put<WeeklyPlanController>(WeeklyPlanController());
  }
}
