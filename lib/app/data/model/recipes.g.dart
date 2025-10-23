// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipesResponseAdapter extends TypeAdapter<RecipesResponse> {
  @override
  final int typeId = 0;

  @override
  RecipesResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipesResponse(
      recipes: (fields[0] as List?)?.cast<Recipe>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecipesResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.recipes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipesResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 1;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      id: fields[0] as int?,
      image: fields[1] as String?,
      title: fields[2] as String?,
      readyInMinutes: fields[3] as int?,
      dairyFree: fields[4] as bool?,
      cookingMinutes: fields[5] as int?,
      extendedIngredients: (fields[6] as List?)?.cast<ExtendedIngredients>(),
      nutrition: fields[7] as Nutrition?,
      analyzedInstructions: (fields[8] as List?)?.cast<AnalyzedInstructions>(),
      isFavorite: fields[9] as bool,
      summary: fields[10] as String?,
      instructions: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.readyInMinutes)
      ..writeByte(4)
      ..write(obj.dairyFree)
      ..writeByte(5)
      ..write(obj.cookingMinutes)
      ..writeByte(6)
      ..write(obj.extendedIngredients)
      ..writeByte(7)
      ..write(obj.nutrition)
      ..writeByte(8)
      ..write(obj.analyzedInstructions)
      ..writeByte(9)
      ..write(obj.isFavorite)
      ..writeByte(10)
      ..write(obj.summary)
      ..writeByte(11)
      ..write(obj.instructions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipesResponse _$RecipesResponseFromJson(Map<String, dynamic> json) =>
    RecipesResponse(
      recipes: (json['recipes'] as List<dynamic>?)
          ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipesResponseToJson(RecipesResponse instance) =>
    <String, dynamic>{
      'recipes': instance.recipes,
    };

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      title: json['title'] as String?,
      readyInMinutes: (json['readyInMinutes'] as num?)?.toInt(),
      dairyFree: json['dairyFree'] as bool?,
      cookingMinutes: (json['cookingMinutes'] as num?)?.toInt(),
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>?)
          ?.map((e) => ExtendedIngredients.fromJson(e as Map<String, dynamic>))
          .toList(),
      nutrition: json['nutrition'] == null
          ? null
          : Nutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
      analyzedInstructions: (json['analyzedInstructions'] as List<dynamic>?)
          ?.map((e) => AnalyzedInstructions.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['isFavorite'] as bool? ?? false,
      summary: json['summary'] as String?,
      instructions: json['instructions'] as String?,
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'readyInMinutes': instance.readyInMinutes,
      'dairyFree': instance.dairyFree,
      'cookingMinutes': instance.cookingMinutes,
      'extendedIngredients': instance.extendedIngredients,
      'nutrition': instance.nutrition,
      'analyzedInstructions': instance.analyzedInstructions,
      'isFavorite': instance.isFavorite,
      'summary': instance.summary,
      'instructions': instance.instructions,
    };
