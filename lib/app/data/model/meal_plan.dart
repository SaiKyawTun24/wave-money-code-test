import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wave_money_code_test/app/data/model/recipes.dart';

part 'meal_plan.g.dart';

@HiveType(typeId: 8)
@JsonSerializable()
class WeeklyMealPlan {
  @HiveField(0)
  final String day;

  @HiveField(1)
  final Recipe recipe;


  WeeklyMealPlan({
    required this.day,
    required this.recipe,
  });

  factory WeeklyMealPlan.fromJson(Map<String, dynamic> json) => _$WeeklyMealPlanFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklyMealPlanToJson(this);
}