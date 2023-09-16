import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'login')
  final String? login;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'company')
  final String? company;
  @JsonKey(name: 'blog')
  final String? blog;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'bio')
  final String? bio;
  @JsonKey(name: 'twitter_username')
  final String? twitterUsername;
  @JsonKey(name: 'public_repos')
  final int? publicRepos;
  @JsonKey(name: 'public_gists')
  final int? publicGists;
  @JsonKey(name: 'followers')
  final int? followers;
  @JsonKey(name: 'following')
  final int? following;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const ProfileModel({
    this.id,
    this.login,
    this.avatarUrl,
    this.htmlUrl,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  Profile toEntity() => Profile(
        id: id,
        login: login,
        avatarUrl: avatarUrl,
        htmlUrl: htmlUrl,
        name: name,
        company: company,
        blog: blog,
        location: location,
        bio: bio,
        twitterUsername: twitterUsername,
        publicRepos: publicRepos,
        publicGists: publicGists,
        followers: followers,
        following: following,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props {
    return [
      id,
      login,
      avatarUrl,
      htmlUrl,
      name,
      company,
      blog,
      location,
      bio,
      twitterUsername,
      publicRepos,
      publicGists,
      followers,
      following,
      createdAt,
      updatedAt,
    ];
  }
}
