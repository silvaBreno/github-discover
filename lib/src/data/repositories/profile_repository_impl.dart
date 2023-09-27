import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:github_discover/src/data/datasources/local/profile_local_data_source.dart';
import 'package:github_discover/src/data/datasources/remote/profile_remote_data_source.dart';
import 'package:github_discover/src/data/utils/exception.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/profile.dart';
import 'package:github_discover/src/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource localDataSource;
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final result = await remoteDataSource.getProfile();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Exception'));
    } on SocketException {
      return const Left(ConnectionFailure('Falha na conexão com a rede'));
    }
  }
}
