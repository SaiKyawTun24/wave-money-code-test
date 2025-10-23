import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nutrition.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Nutrition {
  @HiveField(0)
  List<Nutrients>? nutrients;

  Nutrition({this.nutrients});

  factory Nutrition.fromJson(Map<String, dynamic> json) =>
      _$NutritionFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionToJson(this);
}

@HiveType(typeId: 4)
@JsonSerializable()
class Nutrients {
  @HiveField(0)
  String? name;
  @HiveField(1)
  double? amount;
  @HiveField(2)
  String? unit;
  @HiveField(3)
  double? percentOfDailyNeeds;

  Nutrients({
    this.name,
    this.amount,
    this.unit,
    this.percentOfDailyNeeds,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) =>
      _$NutrientsFromJson(json);

  Map<String, dynamic> toJson() => _$NutrientsToJson(this);
}