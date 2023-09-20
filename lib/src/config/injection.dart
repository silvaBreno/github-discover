import 'package:get_it/get_it.dart';
import 'package:github_discover/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repositories/details/repository_details_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repositories/search/repositories_search_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users/details/user_details_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users/search/users_search_bloc.dart';

final GetIt getIt = GetIt.instance;

void startModules() {
  // Bloc
  getIt.registerFactory<ProfileBloc>(() => ProfileBloc());
  getIt.registerFactory<RepositoriesSearchBloc>(() => RepositoriesSearchBloc());
  getIt.registerFactory<RepositoryDetailsBloc>(() => RepositoryDetailsBloc());
  getIt.registerFactory<UsersSearchBloc>(() => UsersSearchBloc());
  getIt.registerFactory<UserDetailsBloc>(() => UserDetailsBloc());
}
