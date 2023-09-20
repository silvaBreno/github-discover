part of 'repositories_search_bloc.dart';

sealed class RepositoriesSearchState extends Equatable {
  const RepositoriesSearchState();

  @override
  List<Object> get props => [];
}

final class RepositoriesSearchInitial extends RepositoriesSearchState {}

final class RepositoriesSearchLoading extends RepositoriesSearchState {}

final class RepositoriesSearchSuccess extends RepositoriesSearchState {
  final Repositories? repositories;

  const RepositoriesSearchSuccess({
    this.repositories,
  });
}

final class RepositoriesSearchEmpty extends RepositoriesSearchState {}

final class RepositoriesSearchError extends RepositoriesSearchState {
  final String? message;

  const RepositoriesSearchError({
    this.message,
  });
}
