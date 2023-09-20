part of 'users_search_bloc.dart';

sealed class UsersSearchEvent extends Equatable {
  const UsersSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchUsersEvent extends UsersSearchEvent {
  final String? search;

  const SearchUsersEvent({
    required this.search,
  });
}
