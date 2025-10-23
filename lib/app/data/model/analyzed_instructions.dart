import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'analyzed_instructions.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class AnalyzedInstructions {
  @HiveField(0)
  String? name;
  @HiveField(1)
  List<Steps>? steps;

  AnalyzedInstructions({this.name, this.steps});

  factory AnalyzedInstructions.fromJson(Map<String, dynamic> json) => _$AnalyzedInstructionsFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyzedInstructionsToJson(this);
}

@HiveType(typeId: 6)
@JsonSerializable()
class Steps {
  @HiveField(0)
  int? number;
  @HiveField(1)
  String? step;

  Steps({this.number, this.step});

  factory Steps.fromJson(Map<String, dynamic> json) => _$StepsFromJson(json);

  Map<String, dynamic> toJson() => _$StepsToJson(this);
}