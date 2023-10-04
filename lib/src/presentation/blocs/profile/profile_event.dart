part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInitalEvent extends ProfileEvent {}

class SkillAddEvent extends ProfileEvent {
  final String? title;
  final String? description;

  const SkillAddEvent({
    required this.title,
    required this.description,
  });
}

class SkillUpdateEvent extends ProfileEvent {
  final Skill skill;

  const SkillUpdateEvent({
    required this.skill,
  });
}

class SkillDeleteEvent extends ProfileEvent {
  final int? id;

  const SkillDeleteEvent({required this.id});
}
