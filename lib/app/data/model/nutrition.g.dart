// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NutritionAdapter extends TypeAdapter<Nutrition> {
  @override
  final int typeId = 3;

  @override
  Nutrition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutrition(
      nutrients: (fields[0] as List?)?.cast<Nutrients>(),
    );
  }

  @override
  void write(BinaryWriter writer, Nutrition obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.nutrients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NutrientsAdapter extends TypeAdapter<Nutrients> {
  @override
  final int typeId = 4;

  @override
  Nutrients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutrients(
      name: fields[0] as String?,
      amount: fields[1] as double?,
      unit: fields[2] as String?,
      percentOfDailyNeeds: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Nutrients obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.unit)
      ..writeByte(3)
      ..write(obj.percentOfDailyNeeds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutrientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nutrition _$NutritionFromJson(Map<String, dynamic> json) => Nutrition(
      nutrients: (json['nutrients'] as List<dynamic>?)
          ?.map((e) => Nutrients.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NutritionToJson(Nutrition instance) => <String, dynamic>{
      'nutrients': instance.nutrients,
    };

Nutrients _$NutrientsFromJson(Map<String, dynamic> json) => Nutrients(
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      percentOfDailyNeeds: (json['percentOfDailyNeeds'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NutrientsToJson(Nutrients instance) => <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
      'percentOfDailyNeeds': instance.percentOfDailyNeeds,
    };
