import 'package:github_discover/src/data/adapters/skill_hive.dart';
import 'package:github_discover/src/data/models/skill_model.dart';
import 'package:github_discover/src/data/utils/exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String _skillBox = 'skillBox';
const String _latestIdBox = "latestIdBox";
const String _latestId = "_latestId";

abstract class ProfileLocalDataSource {
  Future<List<SkillModel>> getSkillList();
  Future<void> saveSkill(SkillModel skill);
  Future<void> updateSkill(int id, SkillModel skill);
  Future<void> deleteSkill(int id);
  Future<void> deleteAllSkillList();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final HiveInterface hive;

  ProfileLocalDataSourceImpl(this.hive);

  @override
  Future<List<SkillModel>> getSkillList() async {
    final box = await hive.openBox(_skillBox);
    return box.values
        .map((skill) => SkillModel(
              id: skill.id,
              title: skill.title,
              description: skill.description,
              isCompleted: skill.isCompleted,
            ))
        .toList();
  }

  @override
  Future<void> saveSkill(SkillModel skill) async {
    try {
      final box = await hive.openBox(_skillBox);
      final lastIdBox = await hive.openBox(_latestIdBox);
      int latestId = lastIdBox.get(_latestId, defaultValue: 0);

      await box.put(
        latestId + 1,
        SkillHive(
          id: latestId + 1,
          title: skill.title,
          description: skill.description,
          isCompleted: skill.isCompleted,
        ),
      );
      await lastIdBox.put(_latestId, latestId + 1);
    } catch (error) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> updateSkill(int id, SkillModel skill) async {
    try {
      final box = await hive.openBox(_skillBox);
      await box.put(
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
  Future<void> deleteSkill(int id) async {
    try {
      final box = await hive.openBox(_skillBox);

      await box.delete(id);
    } catch (error) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> deleteAllSkillList() async {
    try {
      final box = await hive.openBox('skill');
      await box.clear();
    } catch (error) {
      throw DatabaseException();
    }
  }
}
