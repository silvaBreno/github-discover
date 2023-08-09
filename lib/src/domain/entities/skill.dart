import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final int id;
  final String title;
  final String? description;
  final bool isCompleted;

  const Skill({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
      ];
}

typedef Skills = List<Skill>;
