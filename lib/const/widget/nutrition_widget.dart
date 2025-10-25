import 'package:flutter/material.dart';
import '../../app/data/model/nutrition.dart';
import '../style/style.dart';

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
        Text(
          'Nutrition Facts',
          style: appBarTextStyle,
        ),
        const SizedBox(height: 10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: nutrients.length,
          itemBuilder: (context, index) {
            final nutrient = nutrients[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${nutrient.name}: ${nutrient.amount} ${nutrient.unit}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: (nutrient.name == 'Calories' ||
                                nutrient.name == 'Fat')
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  Text(
                    '${nutrient.percentOfDailyNeeds}% DV',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: (nutrient.name == 'Calories' ||
                              nutrient.name == 'Fat')
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
        Text(
          'Percent Daily Values (DV) are based on a 2,000 calorie diet.',
          style: subtitleTextStyle,
        ),
      ],
    );
  }
}
