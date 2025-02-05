import 'package:equatable/equatable.dart';

class ComicsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? author;
  final String? releasedAt;
  final String? createdAt;
  final String? updatedAt;
  final int? chapter;
  final int? onGoing;
  final String? image;

  const ComicsEntity(
      {this.id,
      this.name,
      this.author,
      this.chapter,
      this.createdAt,
      this.image,
      this.onGoing,
      this.releasedAt,
      this.updatedAt});

  @override
  List<Object?> get props{
    return[
      id,
      name,
      author,
      chapter,
      createdAt,
      image,
      onGoing,
      releasedAt,
      updatedAt
    ];
  }
}
