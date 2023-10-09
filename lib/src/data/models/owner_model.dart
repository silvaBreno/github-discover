import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/owner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_model.g.dart';

@JsonSerializable()
class OwnerModel extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'login')
  final String? login;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  const OwnerModel({
    this.id,
    this.login,
    this.avatarUrl,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);

  Owner toEntity() => Owner(
        id: id,
        login: login,
        avatarUrl: avatarUrl,
      );

  @override
  List<Object?> get props {
    return [
      id,
      login,
      avatarUrl,
    ];
  }
}
