import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skill_model.g.dart';

@JsonSerializable()
class SkillModel extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final bool? isCompleted;

  const SkillModel({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);

  Map<String, dynamic> toJson() => _$SkillModelToJson(this);

  Skill toEntity() => Skill(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
      );

  factory SkillModel.fromEntity(Skill entity) => SkillModel(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        isCompleted: entity.isCompleted,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
      ];
}
