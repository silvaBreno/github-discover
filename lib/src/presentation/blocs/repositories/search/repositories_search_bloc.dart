import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/usecases/repository/get_repository_usecase.dart';

part 'repositories_search_event.dart';
part 'repositories_search_state.dart';

class RepositoriesSearchBloc
    extends Bloc<RepositoriesSearchEvent, RepositoriesSearchState> {
  final GetRepositoriesUseCase getRepositoriesUseCase;

  RepositoriesSearchBloc({required this.getRepositoriesUseCase})
      : super(RepositoriesSearchInitial()) {
    on<SearchRepositoriesEvent>(_onSearchRepositoriesEvent);
  }

  void _onSearchRepositoriesEvent(
    SearchRepositoriesEvent event,
    Emitter emit,
  ) async {
    emit(RepositoriesSearchLoading());

    final result =
        await getRepositoriesUseCase.execute(searchInput: event.search);
    result.fold(
      (failure) {
        emit(RepositoriesSearchError(
          message: failure.message,
        ));
      },
      (data) {
        if (data.isEmpty) {
          emit(RepositoriesSearchEmpty());
        } else {
          emit(RepositoriesSearchSuccess(repositories: data));
        }
      },
    );
  }
}
