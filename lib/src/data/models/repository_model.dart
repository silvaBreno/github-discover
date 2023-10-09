import 'package:equatable/equatable.dart';
import 'package:github_discover/src/data/models/license_model.dart';
import 'package:github_discover/src/data/models/owner_model.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository_model.g.dart';

@JsonSerializable()
class RepositoryModel extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'full_name')
  final String? fullName;
  @JsonKey(name: 'private')
  final bool? private;
  @JsonKey(name: 'owner')
  final OwnerModel? owner;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @JsonKey(name: 'license')
  final LicenseModel? license;
  @JsonKey(name: 'language')
  final String? language;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'visibility')
  final String? visibility;
  @JsonKey(name: 'fork')
  final bool? fork;
  @JsonKey(name: 'stargazers_count')
  final int? stargazersCount;
  @JsonKey(name: 'forks_count')
  final int? forksCount;
  @JsonKey(name: 'subscribers_count')
  final int? subscribersCount;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'pushed_at')
  final String? pushedAt;

  const RepositoryModel({
    this.id,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.license,
    this.language,
    this.description,
    this.visibility,
    this.fork,
    this.forksCount,
    this.stargazersCount,
    this.subscribersCount,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$RepositoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryModelToJson(this);

  Repository toEntity() => Repository(
        id: id,
        name: name,
        fullName: fullName,
        private: private,
        owner: owner?.toEntity(),
        htmlUrl: htmlUrl,
        license: license?.toEntity(),
        language: language,
        description: description,
        visibility: visibility,
        fork: fork,
        stargazersCount: stargazersCount,
        forksCount: forksCount,
        subscribersCount: subscribersCount,
        createdAt: createdAt,
        updatedAt: updatedAt,
        pushedAt: pushedAt,
      );

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
