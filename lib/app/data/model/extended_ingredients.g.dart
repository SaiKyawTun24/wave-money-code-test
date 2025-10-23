// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extended_ingredients.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExtendedIngredientsAdapter extends TypeAdapter<ExtendedIngredients> {
  @override
  final int typeId = 2;

  @override
  ExtendedIngredients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExtendedIngredients(
      id: fields[0] as int?,
      name: fields[1] as String?,
      original: fields[2] as String?,
      amount: fields[3] as double?,
      unit: fields[4] as String?,
      image: fields[5] as String?,
      aisle: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ExtendedIngredients obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.original)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.unit)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.aisle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtendedIngredientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendedIngredients _$ExtendedIngredientsFromJson(Map<String, dynamic> json) =>
    ExtendedIngredients(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      original: json['original'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      image: json['image'] as String?,
      aisle: json['aisle'] as String?,
    );

Map<String, dynamic> _$ExtendedIngredientsToJson(
        ExtendedIngredients instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'original': instance.original,
      'amount': instance.amount,
      'unit': instance.unit,
      'image': instance.image,
      'aisle': instance.aisle,
    };
