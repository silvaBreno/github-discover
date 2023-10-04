import 'package:github_discover/src/domain/repositories/profile_repository.dart';

class SkillDeleteUseCase {
  final ProfileRepository repository;
  SkillDeleteUseCase(this.repository);

  Future<void> execute(int id) {
    return repository.deleteSkill(id);
  }
}
