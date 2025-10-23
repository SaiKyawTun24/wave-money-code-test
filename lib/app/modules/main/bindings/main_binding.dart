import 'package:get/get.dart';
import '../../favorite/controllers/favorite_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.put(HomeController());
    Get.put(FavoriteController());
  }
}
