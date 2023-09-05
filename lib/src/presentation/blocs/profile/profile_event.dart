part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInitalEvent extends ProfileEvent {}

class SkillAddedEvent extends ProfileEvent {
  final Skill skill;

  const SkillAddedEvent({
    required this.skill,
  });
}

class SkillCompletedEvent extends ProfileEvent {
  final Skill skill;

  const SkillCompletedEvent({
    required this.skill,
  });
}

class SkillDeletedEvent extends ProfileEvent {
  final int id;

  const SkillDeletedEvent({required this.id});
}

class SkillReorderedEvent extends ProfileEvent {
  final int oldIndex;
  final int newIndex;

  const SkillReorderedEvent({
    required this.oldIndex,
    required this.newIndex,
  });
}
