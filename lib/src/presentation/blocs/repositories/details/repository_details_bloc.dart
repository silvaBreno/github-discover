import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repository_details_event.dart';
part 'repository_details_state.dart';

class RepositoryDetailsBloc
    extends Bloc<RepositoryDetailsEvent, RepositoryDetailsState> {
  RepositoryDetailsBloc() : super(RepositoryDetailsInitial()) {
    on<RepositoryDetailLoadedEvent>(_onRepositoryDetailLoadedEvent);
  }

  void _onRepositoryDetailLoadedEvent(
    RepositoryDetailLoadedEvent event,
    Emitter emit,
  ) async {
    emit(const RepositoryDetailsSuccess(repository: kRepositoryMock));
  }
}
