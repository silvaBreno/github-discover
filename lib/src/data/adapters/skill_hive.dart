import 'package:hive/hive.dart';

part 'skill_hive.g.dart';

@HiveType(typeId: 1)
class SkillHive {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final bool? isCompleted;

  SkillHive({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });
}
