import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/license.dart';
import 'package:github_discover/src/domain/entities/owner.dart';

class Repository extends Equatable {
  final int? id;
  final String? name;
  final String? fullName;
  final bool? private;
  final Owner? owner;
  final String? htmlUrl;
  final License? license;
  final String? language;
  final String? description;
  final String? visibility;
  final bool? fork;
  final int? stargazersCount;
  final int? forksCount;
  final int? subscribersCount;
  final String? createdAt;
  final String? updatedAt;
  final String? pushedAt;

  const Repository({
    required this.id,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    required this.license,
    required this.language,
    required this.description,
    required this.visibility,
    required this.fork,
    required this.forksCount,
    required this.stargazersCount,
    required this.subscribersCount,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        fullName,
        private,
        owner,
        htmlUrl,
        license,
        language,
        description,
        visibility,
        fork,
        stargazersCount,
        forksCount,
        subscribersCount,
        createdAt,
        updatedAt,
        pushedAt,
      ];
}

typedef Repositories = List<Repository>;
