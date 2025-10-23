import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'analyzed_instructions.dart';
import 'extended_ingredients.dart';
import 'nutrition.dart';

part 'recipes.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class RecipesResponse {
  @HiveField(0)
  List<Recipe>? recipes;

  RecipesResponse({this.recipes});

  factory RecipesResponse.fromJson(Map<String, dynamic> json) => _$RecipesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecipesResponseToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable()
class Recipe {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? image;
  @HiveField(2)
  String? title;
  @HiveField(3)
  int? readyInMinutes;
  @HiveField(4)
  bool? dairyFree;
  @HiveField(5)
  int? cookingMinutes;
  @HiveField(6)
  List<ExtendedIngredients>? extendedIngredients;
  @HiveField(7)
  Nutrition? nutrition;
  @HiveField(8)
  List<AnalyzedInstructions>? analyzedInstructions;
  @HiveField(9)
  bool isFavorite;
  @HiveField(10)
  String? summary;
  @HiveField(11)
  String? instructions;

  Recipe({
    this.id,
    this.image,
    this.title,
    this.readyInMinutes,
    this.dairyFree,
    this.cookingMinutes,
    this.extendedIngredients,
    this.nutrition,
    this.analyzedInstructions,
    this.isFavorite = false,
    this.summary,
    this.instructions,
  });

  Recipe copyWith({
    int? id,
    String? image,
    String? title,
    int? readyInMinutes,
    bool? dairyFree,
    int? cookingMinutes,
    List<ExtendedIngredients>? extendedIngredients,
    Nutrition? nutrition,
    List<AnalyzedInstructions>? analyzedInstructions,
    bool? isFavorite, // Allows updating the favorite status
    String? summary,
    String? instructions,
  }) {
    return Recipe(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      readyInMinutes: readyInMinutes ?? this.readyInMinutes,
      dairyFree: dairyFree ?? this.dairyFree,
      cookingMinutes: cookingMinutes ?? this.cookingMinutes,
      extendedIngredients: extendedIngredients ?? this.extendedIngredients,
      nutrition: nutrition ?? this.nutrition,
      analyzedInstructions: analyzedInstructions ?? this.analyzedInstructions,
      isFavorite: isFavorite ?? this.isFavorite, // Merges the new or existing value
      summary: summary ?? this.summary,
      instructions: instructions ?? this.instructions,
    );
  }

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
