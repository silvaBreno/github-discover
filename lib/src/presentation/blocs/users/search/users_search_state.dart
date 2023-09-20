part of 'users_search_bloc.dart';

sealed class UsersSearchState extends Equatable {
  const UsersSearchState();

  @override
  List<Object> get props => [];
}

final class UsersSearchInitial extends UsersSearchState {}

final class UsersSearchLoading extends UsersSearchState {}

final class UsersSearchSuccess extends UsersSearchState {
  final Users? users;

  const UsersSearchSuccess({
    this.users,
  });
}

final class UsersSearchEmpty extends UsersSearchState {}

final class UsersSearchError extends UsersSearchState {
  final String? message;

  const UsersSearchError({
    this.message,
  });
}
