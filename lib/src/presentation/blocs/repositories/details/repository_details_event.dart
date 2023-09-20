part of 'repository_details_bloc.dart';

sealed class RepositoryDetailsEvent extends Equatable {
  const RepositoryDetailsEvent();

  @override
  List<Object> get props => [];
}

class RepositoryDetailLoadedEvent extends RepositoryDetailsEvent {
  final String? fullName;

  const RepositoryDetailLoadedEvent({
    this.fullName,
  });
}
