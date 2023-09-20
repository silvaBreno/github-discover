part of 'repositories_search_bloc.dart';

sealed class RepositoriesSearchEvent extends Equatable {
  const RepositoriesSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchRepositoriesEvent extends RepositoriesSearchEvent {
  final String? search;

  const SearchRepositoriesEvent({
    required this.search,
  });
}
