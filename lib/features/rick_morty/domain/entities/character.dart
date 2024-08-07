import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String imageUrl;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, status, imageUrl];
}
