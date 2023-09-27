import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_discover/src/config/environment/env.dart';
import 'package:github_discover/src/data/models/profile_model.dart';
import 'package:github_discover/src/data/utils/endpoints.dart';
import 'package:github_discover/src/data/utils/exception.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl(this.dio);

  @override
  Future<ProfileModel> getProfile() async {
    final response = await dio.get(
      '${Env.baseUrl}${Endpoint.profile}',
    );

    if (response.statusCode == HttpStatus.ok) {
      return ProfileModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
