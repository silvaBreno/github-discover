import 'package:github_discover/src/domain/entities/license.dart';
import 'package:github_discover/src/domain/entities/owner.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

const kRepositoryMock = Repository(
  id: 0,
  name: 'fiap',
  fullName: 'fiap/fiap',
  private: true,
  owner: Owner(
    id: 0,
    login: 'fiap',
    avatarUrl:
        'https://media.licdn.com/dms/image/C4D0BAQFGUHRJ26bFDw/company-logo_200_200/0/1519856619408?e=1699488000&v=beta&t=ZmHH9S3D3olLSwAS_Egw862invpc80wKT_Gd0C3n2A0',
  ),
  htmlUrl: '',
  license: License(
    name: 'MIT License',
    spdxId: 'MIT',
    url: 'https://api.github.com/licenses/mit',
  ),
  language: 'Dart',
  description: 'Cross Platform Engineer',
  visibility: 'public',
  fork: false,
  forksCount: 3,
  stargazersCount: 30,
  subscribersCount: 2,
  createdAt: '',
  updatedAt: '',
  pushedAt: '',
);
