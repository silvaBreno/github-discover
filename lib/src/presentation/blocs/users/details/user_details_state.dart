part of 'user_details_bloc.dart';

sealed class UserDetailsState extends Equatable {
  const UserDetailsState();

  @override
  List<Object> get props => [];
}

final class UserDetailsInitial extends UserDetailsState {}

final class UserDetailsLoading extends UserDetailsState {}

final class UserDetailsSuccess extends UserDetailsState {
  final User? user;
  final Repositories? repositories;

  const UserDetailsSuccess({
    required this.user,
    required this.repositories,
  });
}

final class UserDetailsError extends UserDetailsState {
  final String? message;

  const UserDetailsError({
    this.message,
  });
}
