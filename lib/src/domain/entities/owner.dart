import 'package:equatable/equatable.dart';

class Owner extends Equatable {
  final int? id;
  final String? login;
  final String? avatarUrl;

  const Owner({
    required this.id,
    required this.login,
    required this.avatarUrl,
  });

  @override
  List<Object?> get props => [
        id,
        login,
        avatarUrl,
      ];
}
