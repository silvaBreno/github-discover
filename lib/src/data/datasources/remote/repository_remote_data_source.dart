import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_discover/src/config/environment/env.dart';
import 'package:github_discover/src/data/models/repository_model.dart';
import 'package:github_discover/src/data/utils/endpoints.dart';
import 'package:github_discover/src/data/utils/exception.dart';

abstract class RepositoryRemoteDataSource {
  Future<List<RepositoryModel>> getRepositories({String? searchInput});
  Future<RepositoryModel> getRepository(String fullname);
}

class RepositoryRemoteDataSourceImpl implements RepositoryRemoteDataSource {
  final Dio dio;

  RepositoryRemoteDataSourceImpl(this.dio);

  Future<List<RepositoryModel>> getRepositories({String? searchInput}) async {
    String userInput = "";
    if (searchInput != null && searchInput.isNotEmpty) {
      userInput = '?q=$searchInput';
    }

    try {
      Response response = await dio
          .get('${Env.baseUrl}${Endpoint.searchRepositories}$userInput');

      if (response.statusCode == HttpStatus.ok) {
        List<RepositoryModel> repositories = List.empty(growable: true);
        Map data = response.data;
        List items = data["items"];
        for (var element in items) {
          repositories.add(RepositoryModel.fromJson(element));
        }
        return repositories;
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<RepositoryModel> getRepository(String fullName) async {
    final response = await dio.get(
      '${Env.baseUrl}${Endpoint.repository}$fullName',
    );

    if (response.statusCode == HttpStatus.ok) {
      return RepositoryModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
