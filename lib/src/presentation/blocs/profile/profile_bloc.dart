import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/skill_mock.dart';
import 'package:github_discover/src/domain/entities/profile.dart';
import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/domain/usecases/profile/get_profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;

  ProfileBloc({
    required GetProfileUseCase getProfileUseCase,
  })  : _getProfileUseCase = getProfileUseCase,
        super(ProfileInitial()) {
    on<ProfileInitalEvent>(_onProfileInitalEvent);
    on<SkillAddedEvent>(_onSkillAddedEvent);
    on<SkillCompletedEvent>(_onSkillCompletedEvent);
    on<SkillDeletedEvent>(_onSkillDeletedEvent);
    on<SkillReorderedEvent>(_onSkillReorderedEvent);
  }

  void _onProfileInitalEvent(
    ProfileInitalEvent event,
    Emitter emit,
  ) async {
    emit(ProfileLoadingState());

    final result = await _getProfileUseCase.execute();

    result.fold(
      (failure) {
        emit(ProfileErrorState(
          message: failure.message,
        ));
      },
      (data) {
        emit(ProfileSuccessState(
          profile: data,
          skills: kSkillsMock,
        ));
      },
    );
  }

  void _onSkillAddedEvent(
    SkillAddedEvent event,
    Emitter emit,
  ) async {}

  void _onSkillCompletedEvent(
    SkillCompletedEvent event,
    Emitter emit,
  ) async {}

  void _onSkillDeletedEvent(
    SkillDeletedEvent event,
    Emitter emit,
  ) async {}

  void _onSkillReorderedEvent(
    SkillReorderedEvent event,
    Emitter emit,
  ) async {
    int newIndex = event.newIndex;
    if (event.oldIndex < event.newIndex) {
      newIndex -= 1;
    }
    final Skill item = state.skills!.removeAt(event.oldIndex);
    state.skills!.insert(newIndex, item);
  }
}
