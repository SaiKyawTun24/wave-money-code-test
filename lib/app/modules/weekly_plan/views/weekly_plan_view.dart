import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wave_money_code_test/const/style/style.dart';
import 'package:wave_money_code_test/const/widget/image_widget.dart';

import '../../../../const/widget/day_expansion_tile.dart';
import '../controllers/weekly_plan_controller.dart';

class WeeklyPlanView extends StatelessWidget {
  const WeeklyPlanView({super.key});

  WeeklyPlanController get controller => Get.find<WeeklyPlanController>();

  void _confirmClearPlan() {
    Get.defaultDialog(
      title: "Clear Weekly Plan",
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      content: Text(
        "Are you sure you want to remove all recipes from your weekly plan? This action cannot be undone.",
        style: subtitleTextStyle,
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            controller.clearAllWeeklyPlan();
            Get.back();
          },
          child: const Text("Clear All", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Weekly Plan"),
            centerTitle: true,
            actions: [
              if (controller.weeklyPlan!.isNotEmpty &&
                  !controller.isLoading.value)
                TextButton.icon(
                  onPressed: _confirmClearPlan,
                  icon: const Icon(Icons.delete_sweep, color: Colors.red),
                  label: const Text('Clear All',
                      style: TextStyle(color: Colors.red)),
                ),
            ],
          ),
          body: _buildBody(context),
        );
      }),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (controller.isLoading.value)
      return const Center(child: CircularProgressIndicator());

    if (controller.errorMessage.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text(
                'Error: ${controller.errorMessage}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.fetchWeeklyPlan,
                child: const Text('Try Reloading Plan'),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: controller.days.length,
      itemBuilder: (context, index) {
        final day = controller.days[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: DayExpansionTile(
            day: day,
            controller: controller,
          ),
        );
      },
    );
  }
}
