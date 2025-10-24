// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_plan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeeklyMealPlanAdapter extends TypeAdapter<WeeklyMealPlan> {
  @override
  final int typeId = 8;

  @override
  WeeklyMealPlan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeeklyMealPlan(
      day: fields[0] as String,
      recipe: fields[1] as Recipe,
    );
  }

  @override
  void write(BinaryWriter writer, WeeklyMealPlan obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.recipe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeeklyMealPlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyMealPlan _$WeeklyMealPlanFromJson(Map<String, dynamic> json) =>
    WeeklyMealPlan(
      day: json['day'] as String,
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeeklyMealPlanToJson(WeeklyMealPlan instance) =>
    <String, dynamic>{
      'day': instance.day,
      'recipe': instance.recipe,
    };
