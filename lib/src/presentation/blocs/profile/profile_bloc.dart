import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/domain/entities/profile.dart';
import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/domain/usecases/profile/get_profile_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/get_skills_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/skill_add_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/skill_delete_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/skill_updated_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final GetSkillsUseCase getSkillsUseCase;
  final SkillAddUseCase skillAddUseCase;
  final SkillDeleteUseCase skillDeleteUseCase;
  final SkillUpdateUseCase skillUpdateUseCase;

  ProfileBloc({
    required this.getProfileUseCase,
    required this.getSkillsUseCase,
    required this.skillAddUseCase,
    required this.skillDeleteUseCase,
    required this.skillUpdateUseCase,
  }) : super(ProfileInitial()) {
    on<ProfileInitalEvent>(_onProfileInitalEvent);

    on<SkillAddEvent>(_onSkillAddEvent);
    on<SkillDeleteEvent>(_onSkillDeleteEvent);
    on<SkillUpdateEvent>(_onSkillUpdateEvent);
  }

  void _onProfileInitalEvent(
    ProfileInitalEvent event,
    Emitter emit,
  ) async {
    emit(ProfileLoadingState());
    final profileResult = await getProfileUseCase.execute();
    final skillsResult = await getSkillsUseCase.execute();
    profileResult.fold(
      (failure) {
        emit(ProfileErrorState(
          message: failure.message,
        ));
      },
      (data) {
        emit(ProfileSuccessState(
          profile: data,
          skills: skillsResult,
        ));
      },
    );
  }

  void _onSkillAddEvent(
    SkillAddEvent event,
    Emitter emit,
  ) async {
    try {
      skillAddUseCase.execute(Skill(
        id: 0,
        title: event.title,
        description: event.description,
        isCompleted: false,
      ));
      add(ProfileInitalEvent());
    } catch (error) {
      emit(const ProfileErrorState(message: 'Hive Error'));
    }
  }

  void _onSkillDeleteEvent(
    SkillDeleteEvent event,
    Emitter emit,
  ) async {
    try {
      skillDeleteUseCase.execute(event.id!);
      add(ProfileInitalEvent());
    } catch (error) {
      emit(const ProfileErrorState(message: 'Hive Error'));
    }
  }

  void _onSkillUpdateEvent(
    SkillUpdateEvent event,
    Emitter emit,
  ) async {
    try {
      skillUpdateUseCase.execute(event.skill);
      add(ProfileInitalEvent());
    } catch (error) {
      emit(const ProfileErrorState(message: 'Hive Error'));
    }
  }
}
