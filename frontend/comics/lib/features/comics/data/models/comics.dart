import 'package:comics/features/comics/domain/entities/comics.dart';

class ComicResponse {
  final String message;
  final List<ComicsModel> data;

  ComicResponse({
    required this.message,
    required this.data,
  });

  factory ComicResponse.fromJson(Map<String, dynamic> json) {
    return ComicResponse(
      message: json['message'],
      data: (json['data'] as List).map((e) => ComicsModel.fromJson(e)).toList(),
    );
  }
}

class ComicsModel extends ComicsEntity {
  const ComicsModel({
    int? id,
    String? name,
    String? author,
    String? releasedAt,
    String? createdAt,
    String? updatedAt,
    int? chapter,
    int? onGoing,
    String? image,
  }) : super(
    id: id,
    name: name,
    author: author,
    releasedAt: releasedAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
    chapter: chapter,
    onGoing: onGoing,
    image: image,
  );

  factory ComicsModel.fromJson(Map<String, dynamic> map) {
    return ComicsModel(
      id: map["id"] ?? 0,
      name: map["name"] ?? "",
      author: map["author"] ?? "",
      releasedAt: map["released_at"] ?? "",
      createdAt: map["created_at"] ?? "",
      updatedAt: map["updated_at"] ?? "",
      chapter: map["chapter"] ?? 0,
      onGoing: map["on_going"] ?? 0,
      image: map["image"] ?? "",
    );
  }
}