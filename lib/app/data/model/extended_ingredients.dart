import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'extended_ingredients.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class ExtendedIngredients {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? original;
  @HiveField(3)
  double? amount;
  @HiveField(4)
  String? unit;
  @HiveField(5)
  String? image;
  @HiveField(6)
  String? aisle;
  ExtendedIngredients({
    this.id,
    this.name,
    this.original,
    this.amount,
    this.unit,
    this.image,
    this.aisle,
  });

  factory ExtendedIngredients.fromJson(Map<String, dynamic> json) => _$ExtendedIngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$ExtendedIngredientsToJson(this);
}