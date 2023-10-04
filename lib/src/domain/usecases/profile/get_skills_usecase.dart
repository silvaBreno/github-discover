import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/domain/repositories/profile_repository.dart';

class GetSkillsUseCase {
  final ProfileRepository repository;
  GetSkillsUseCase(this.repository);

  Future<Skills> execute() async {
    return await repository.getSkillList();
  }
}
