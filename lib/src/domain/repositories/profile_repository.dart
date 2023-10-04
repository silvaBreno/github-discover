import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/profile.dart';
import 'package:github_discover/src/domain/entities/skill.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
  Future<Skills> getSkillList();
  Future<void> addSkill(Skill skill);
  Future<void> deleteSkill(int id);
  Future<void> updateSkill(Skill skill);
}
