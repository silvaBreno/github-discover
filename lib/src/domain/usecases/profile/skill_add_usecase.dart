import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/domain/repositories/profile_repository.dart';

class SkillAddUseCase {
  final ProfileRepository repository;
  SkillAddUseCase(this.repository);

  Future<void> execute(Skill skill) {
    return repository.addSkill(skill);
  }
}
