import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repositories_search_event.dart';
part 'repositories_search_state.dart';

class RepositoriesSearchBloc
    extends Bloc<RepositoriesSearchEvent, RepositoriesSearchState> {
  RepositoriesSearchBloc() : super(RepositoriesSearchInitial()) {
    on<SearchRepositoriesEvent>(_onSearchRepositoriesEvent);
  }

  void _onSearchRepositoriesEvent(
    SearchRepositoriesEvent event,
    Emitter emit,
  ) async {
    emit(const RepositoriesSearchSuccess(
      repositories: [
        kRepositoryMock,
        kRepositoryMock,
        kRepositoryMock,
      ],
    ));
  }
}
