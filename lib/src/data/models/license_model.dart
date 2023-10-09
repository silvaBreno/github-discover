import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/license.dart';
import 'package:json_annotation/json_annotation.dart';

part 'license_model.g.dart';

@JsonSerializable()
class LicenseModel extends Equatable {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'spdx_id')
  final String? spdxId;

  @JsonKey(name: 'url')
  final String? url;

  const LicenseModel({
    this.name,
    this.spdxId,
    this.url,
  });

  factory LicenseModel.fromJson(Map<String, dynamic> json) =>
      _$LicenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseModelToJson(this);

  License toEntity() => License(
        name: name,
        spdxId: spdxId,
        url: url,
      );

  @override
  List<Object?> get props => [
        name,
        spdxId,
        url,
      ];
}
