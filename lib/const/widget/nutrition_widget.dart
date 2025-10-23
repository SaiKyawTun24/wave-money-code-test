import 'package:flutter/material.dart';

import '../../app/data/model/nutrition.dart';

class NutritionWidget extends StatelessWidget {
  final List<Nutrients> nutrients;

  const NutritionWidget({super.key, required this.nutrients});

  @override
  Widget build(BuildContext context) {
    if (nutrients.isEmpty) {
      return const Center(child: Text('No nutrition information available.'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nutrition Facts',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          // Prevents the list from scrolling independently if nested
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true, // Takes only the space it needs
          itemCount: nutrients.length,
          itemBuilder: (context, index) {
            final nutrient = nutrients[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Name and Amount
                  Expanded(
                    child: Text(
                      // Display name and amount (e.g., "Calories 191.9 kcal")
                      '${nutrient.name}: ${nutrient.amount} ${nutrient.unit}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: (nutrient.name == 'Calories' || nutrient.name == 'Fat')
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  Text(
                    '${nutrient.percentOfDailyNeeds}% DV', // DV stands for Daily Value
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: (nutrient.name == 'Calories' || nutrient.name == 'Fat')
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const Divider(height: 20, thickness: 1),
        const Text(
          'Percent Daily Values (DV) are based on a 2,000 calorie diet.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}