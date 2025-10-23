import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recipe_detail_controller.dart';

class RecipeDetailView extends GetView<RecipeDetailController> {
  const RecipeDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecipeDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecipeDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
