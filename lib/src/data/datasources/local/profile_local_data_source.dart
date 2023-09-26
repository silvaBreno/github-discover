import 'package:github_discover/src/data/adapters/skill_hive.dart';
import 'package:github_discover/src/data/models/skill_model.dart';
import 'package:github_discover/src/data/utils/exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ProfileLocalDataSource {
  List<SkillModel> getSkillList();
  void saveSkill(SkillModel skill);
  void updateSkill(int id, SkillModel skill);
  void deleteSkill(int id);
  void deleteAllSkillList();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final HiveInterface hive;

  ProfileLocalDataSourceImpl(this.hive);

  late Box _skillBox;

  @override
  List<SkillModel> getSkillList() {
    return _skillBox.values
        .map((skill) => SkillModel(
              id: skill.id,
              title: skill.title,
              description: skill.description,
              isCompleted: skill.isCompleted,
            ))
        .toList();
  }

  @override
  void saveSkill(SkillModel skill) async {
    try {
      await _skillBox.put(
        skill.id,
        SkillHive(
          id: skill.id,
          title: skill.title,
          description: skill.description,
          isCompleted: skill.isCompleted,
        ),
      );
    } catch (error) {
      throw DatabaseException();
    }
  }

  @override
  void updateSkill(int id, SkillModel skill) async {
    try {
      await _skillBox.put(
        id,
        SkillHive(
          id: skill.id,
          title: skill.title,
          description: skill.description,
          isCompleted: skill.isCompleted,
        ),
      );
    } catch (error) {
      throw DatabaseException();
    }
  }

  @override
  void deleteSkill(int id) async {
    try {
      await _skillBox.delete(id);
    } catch (error) {
      throw DatabaseException();
    }
  }

  @override
  void deleteAllSkillList() async {
    try {
      await _skillBox.clear();
    } catch (error) {
      throw DatabaseException();
    }
  }
}
