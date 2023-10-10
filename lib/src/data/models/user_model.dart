import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  @JsonKey(name: 'login')
  final String? login;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'node_id')
  final int? nodeId;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(name: 'gravatar_id')
  final String? gravatarId;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @JsonKey(name: 'followers_url')
  final String? followersUrl;
  @JsonKey(name: 'following_url')
  final String? followingUrl;
  @JsonKey(name: 'gists_url')
  final String? gistsUrl;
  @JsonKey(name: 'starred_url')
  final String? starredUrl;
  @JsonKey(name: 'subscriptions_url')
  final String? subscriptionsUrl;
  @JsonKey(name: 'organizations_url')
  final String? organizationsUrl;
  @JsonKey(name: 'repos_url')
  final String? reposUrl;
  @JsonKey(name: 'events_url')
  final String? eventsUrl;
  @JsonKey(name: 'received_events_url"')
  final String? receivedEventsUrl;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'site_admin')
  final String? siteAdmin;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'company')
  final String? company;
  @JsonKey(name: 'blog')
  final String? blog;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'hireable')
  final String? hireable;
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

  const UserModel({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() => User(
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
      login,
      id,
      nodeId,
      avatarUrl,
      gravatarId,
      url,
      htmlUrl,
      followersUrl,
      followingUrl,
      gistsUrl,
      starredUrl,
      subscriptionsUrl,
      organizationsUrl,
      reposUrl,
      eventsUrl,
      receivedEventsUrl,
      type,
      siteAdmin,
      name,
      company,
      blog,
      location,
      email,
      hireable,
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
