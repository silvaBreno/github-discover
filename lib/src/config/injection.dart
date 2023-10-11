import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:github_discover/src/config/hive.dart';
import 'package:github_discover/src/data/datasources/local/profile_local_data_source.dart';
import 'package:github_discover/src/data/datasources/remote/profile_remote_data_source.dart';
import 'package:github_discover/src/data/datasources/remote/repository_remote_data_source.dart';
import 'package:github_discover/src/data/repositories/profile_repository_impl.dart';
import 'package:github_discover/src/data/repositories/repository_repository_impl.dart';
import 'package:github_discover/src/domain/repositories/profile_repository.dart';
import 'package:github_discover/src/domain/repositories/repository_repository.dart';
import 'package:github_discover/src/domain/usecases/profile/get_profile_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/get_skills_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/skill_add_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/skill_delete_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/skill_updated_usecase.dart';
import 'package:github_discover/src/domain/usecases/repository/get_repository_details_usecase.dart';
import 'package:github_discover/src/domain/usecases/repository/get_repository_usecase.dart';
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

  //-> RemoteDataSource Repository
  getIt.registerLazySingleton<RepositoryRemoteDataSource>(
    () => RepositoryRemoteDataSourceImpl(getIt<Dio>()),
  );

  // Repositories
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(
        localDataSource: getIt<ProfileLocalDataSource>(),
        remoteDataSource: getIt<ProfileRemoteDataSource>(),
      ));
  //-> Repositories Repository
  getIt.registerLazySingleton<RepositoryRepository>(
      () => RepositoryRepositoryImpl(
            remoteDataSource: getIt<RepositoryRemoteDataSource>(),
          ));

  // UseCases
  //-> UseCases Profile
  getIt.registerLazySingleton(() => GetProfileUseCase(
        getIt<ProfileRepository>(),
      ));
  getIt.registerLazySingleton(() => GetSkillsUseCase(
        getIt<ProfileRepository>(),
      ));
  getIt.registerLazySingleton(() => SkillAddUseCase(
        getIt<ProfileRepository>(),
      ));
  getIt.registerLazySingleton(() => SkillDeleteUseCase(
        getIt<ProfileRepository>(),
      ));
  getIt.registerLazySingleton(() => SkillUpdateUseCase(
        getIt<ProfileRepository>(),
      ));
  //-> UseCases Repository
  getIt.registerLazySingleton(() => GetRepositoriesUseCase(
        getIt<RepositoryRepository>(),
      ));
  getIt.registerLazySingleton(() => GetRepositoryDetailsUseCase(
        getIt<RepositoryRepository>(),
      ));

  // Blocs
  getIt.registerFactory<ProfileBloc>(() => ProfileBloc(
        getProfileUseCase: getIt<GetProfileUseCase>(),
        getSkillsUseCase: getIt<GetSkillsUseCase>(),
        skillAddUseCase: getIt<SkillAddUseCase>(),
        skillDeleteUseCase: getIt<SkillDeleteUseCase>(),
        skillUpdateUseCase: getIt<SkillUpdateUseCase>(),
      ));
  //-> Blocs Repository
  getIt.registerFactory<RepositoriesSearchBloc>(() => RepositoriesSearchBloc(
        getRepositoriesUseCase: getIt<GetRepositoriesUseCase>(),
      ));
  getIt.registerFactory<RepositoryDetailsBloc>(() => RepositoryDetailsBloc(
        getRepositoryDetailsUseCase: getIt<GetRepositoryDetailsUseCase>(),
      ));
  getIt.registerFactory<UsersSearchBloc>(() => UsersSearchBloc());
  getIt.registerFactory<UserDetailsBloc>(() => UserDetailsBloc());
}
