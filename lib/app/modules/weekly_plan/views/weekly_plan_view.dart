import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_money_code_test/const/color/color.dart';
import 'package:wave_money_code_test/const/style/style.dart';
import '../../../../const/widget/weekly_body_widget.dart';
import '../controllers/weekly_plan_controller.dart';

class WeeklyPlanView extends GetView<WeeklyPlanController> {
  const WeeklyPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.buttonBarColor,
            title: Text("Weekly Plan", style: appBarTextStyle),
            centerTitle: true,
            actions: [
              if (controller.weeklyPlan!.isNotEmpty &&
                  !controller.isLoading.value)
                TextButton.icon(
                  onPressed: controller.confirmClearPlan,
                  icon: Icon(Icons.delete_sweep, color: AppColors.redColor),
                  label: Text('Clear All', style: clearTextStyle),
                ),
            ],
          ),
          body: WeeklyBodyWidget(controller: controller),
        ),
      ),
    );
  }
}
