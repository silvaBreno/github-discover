import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'users_search_event.dart';
part 'users_search_state.dart';

class UsersSearchBloc extends Bloc<UsersSearchEvent, UsersSearchState> {
  UsersSearchBloc() : super(UsersSearchInitial()) {
    on<SearchUsersEvent>(_onSearchUsersEvent);
  }

  void _onSearchUsersEvent(
    SearchUsersEvent event,
    Emitter emit,
  ) async {
    emit(const UsersSearchSuccess(
      users: [
        kUserMock,
        kUserMock,
        kUserMock,
        kUserMock,
        kUserMock,
        kUserMock,
        kUserMock,
        kUserMock,
        kUserMock,
        kUserMock,
      ],
    ));
  }
}
