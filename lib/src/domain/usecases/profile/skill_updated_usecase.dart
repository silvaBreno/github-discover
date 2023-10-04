import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/domain/repositories/profile_repository.dart';

class SkillUpdateUseCase {
  final ProfileRepository repository;
  SkillUpdateUseCase(this.repository);

  Future<void> execute(Skill skill) {
    return repository.updateSkill(skill);
  }
}
