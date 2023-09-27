import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:github_discover/src/config/hive.dart';
import 'package:github_discover/src/data/datasources/local/profile_local_data_source.dart';
import 'package:github_discover/src/data/datasources/remote/profile_remote_data_source.dart';
import 'package:github_discover/src/data/repositories/profile_repository_impl.dart';
import 'package:github_discover/src/domain/repositories/profile_repository.dart';
import 'package:github_discover/src/domain/usecases/profile/get_profile_usecase.dart';
import 'package:github_discover/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repositories/details/repository_details_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repositories/search/repositories_search_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users/details/user_details_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users/search/users_search_bloc.dart';

final GetIt getIt = GetIt.instance;

void startModules() {
  final dio = Dio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // LocalDataSource
  getIt.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(hive),
  );

  // RemoteDataSource
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(getIt<Dio>()),
  );

  // Repositories
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(
        localDataSource: getIt<ProfileLocalDataSource>(),
        remoteDataSource: getIt<ProfileRemoteDataSource>(),
      ));

  // UseCases
  getIt.registerLazySingleton(() => GetProfileUseCase(
        getIt<ProfileRepository>(),
      ));

  // Blocs
  getIt.registerFactory<ProfileBloc>(() => ProfileBloc(
        getProfileUseCase: getIt<GetProfileUseCase>(),
      ));
  getIt.registerFactory<RepositoriesSearchBloc>(() => RepositoriesSearchBloc());
  getIt.registerFactory<RepositoryDetailsBloc>(() => RepositoryDetailsBloc());
  getIt.registerFactory<UsersSearchBloc>(() => UsersSearchBloc());
  getIt.registerFactory<UserDetailsBloc>(() => UserDetailsBloc());
}
