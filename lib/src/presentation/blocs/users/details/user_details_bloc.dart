import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(UserDetailsInitial()) {
    on<UserDetailLoadedEvent>(_onUserDetailLoadedEvent);
  }

  void _onUserDetailLoadedEvent(
    UserDetailLoadedEvent event,
    Emitter emit,
  ) async {
    emit(const UserDetailsSuccess(
      user: kUserMock,
      repositories: [
        kRepositoryMock,
        kRepositoryMock,
        kRepositoryMock,
        kRepositoryMock,
        kRepositoryMock,
      ],
    ));
  }
}
