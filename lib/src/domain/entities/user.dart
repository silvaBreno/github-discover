import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? login;
  final String? avatarUrl;
  final String? htmlUrl;
  final String? name;
  final String? company;
  final String? blog;
  final String? location;
  final String? bio;
  final String? twitterUsername;
  final int? publicRepos;
  final int? publicGists;
  final int? followers;
  final int? following;
  final String? createdAt;
  final String? updatedAt;

  const User({
    required this.id,
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.name,
    required this.company,
    required this.blog,
    required this.location,
    required this.bio,
    required this.twitterUsername,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
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

typedef Users = List<User>;
