import 'package:equatable/equatable.dart';

class License extends Equatable {
  final String? name;
  final String? spdxId;
  final String? url;

  const License({
    required this.name,
    required this.spdxId,
    required this.url,
  });

  @override
  List<Object?> get props => [
        name,
        spdxId,
        url,
      ];
}
