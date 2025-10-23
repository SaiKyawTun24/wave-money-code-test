import 'package:get/get.dart';

import '../controllers/weekly_plan_controller.dart';

class WeeklyPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeeklyPlanController>(
      () => WeeklyPlanController(),
    );
  }
}
