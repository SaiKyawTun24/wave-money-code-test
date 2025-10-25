import 'package:flutter/material.dart';
import 'package:wave_money_code_test/app/modules/weekly_plan/controllers/weekly_plan_controller.dart';
import '../color/color.dart';
import '../style/style.dart';
import 'day_expansion_tile.dart';

class WeeklyBodyWidget extends StatelessWidget {
  const WeeklyBodyWidget({super.key, required this.controller});

  final WeeklyPlanController controller;

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }

    if (controller.errorMessage.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: AppColors.redColor, size: 48),
              const SizedBox(height: 16),
              Text(
                'Error: ${controller.errorMessage}',
                textAlign: TextAlign.center,
                style: errorMessageTextStyle,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.fetchWeeklyPlan,
                child: Text('Try Reloading Plan', style: titleTextStyle),
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
