part of 'repository_details_bloc.dart';

sealed class RepositoryDetailsState extends Equatable {
  const RepositoryDetailsState();

  @override
  List<Object> get props => [];
}

final class RepositoryDetailsInitial extends RepositoryDetailsState {}

final class RepositoryDetailsLoading extends RepositoryDetailsState {}

final class RepositoryDetailsSuccess extends RepositoryDetailsState {
  final Repository? repository;

  const RepositoryDetailsSuccess({
    required this.repository,
  });
}

final class RepositoryDetailsError extends RepositoryDetailsState {
  final String? message;

  const RepositoryDetailsError({
    this.message,
  });
}
