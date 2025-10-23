// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyzed_instructions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnalyzedInstructionsAdapter extends TypeAdapter<AnalyzedInstructions> {
  @override
  final int typeId = 5;

  @override
  AnalyzedInstructions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnalyzedInstructions(
      name: fields[0] as String?,
      steps: (fields[1] as List?)?.cast<Steps>(),
    );
  }

  @override
  void write(BinaryWriter writer, AnalyzedInstructions obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.steps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyzedInstructionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StepsAdapter extends TypeAdapter<Steps> {
  @override
  final int typeId = 6;

  @override
  Steps read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Steps(
      number: fields[0] as int?,
      step: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Steps obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.step);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyzedInstructions _$AnalyzedInstructionsFromJson(
        Map<String, dynamic> json) =>
    AnalyzedInstructions(
      name: json['name'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Steps.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnalyzedInstructionsToJson(
        AnalyzedInstructions instance) =>
    <String, dynamic>{
      'name': instance.name,
      'steps': instance.steps,
    };

Steps _$StepsFromJson(Map<String, dynamic> json) => Steps(
      number: (json['number'] as num?)?.toInt(),
      step: json['step'] as String?,
    );

Map<String, dynamic> _$StepsToJson(Steps instance) => <String, dynamic>{
      'number': instance.number,
      'step': instance.step,
    };
