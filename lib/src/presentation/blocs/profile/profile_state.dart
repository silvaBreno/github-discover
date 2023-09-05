part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  final Profile? profile;
  final Skills? skills;

  const ProfileState({
    this.profile,
    this.skills,
  });

  @override
  List<Object?> get props => [profile, skills];
}

final class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  const ProfileSuccessState({
    required super.profile,
    required super.skills,
  });
}

class ProfileErrorState extends ProfileState {
  final String? message;

  const ProfileErrorState({
    this.message,
  });
}
