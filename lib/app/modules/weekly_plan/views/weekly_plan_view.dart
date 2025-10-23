import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/weekly_plan_controller.dart';

class WeeklyPlanView extends GetView<WeeklyPlanController> {
  const WeeklyPlanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeeklyPlanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WeeklyPlanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
