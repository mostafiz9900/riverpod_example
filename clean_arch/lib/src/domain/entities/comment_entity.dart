// To parse this JSON data, do
//
//     final commentEntity = commentEntityFromJson(jsonString);

import 'dart:convert';

List<CommentEntity> commentEntityFromJson(String str) =>
    List<CommentEntity>.from(
        json.decode(str).map((x) => CommentEntity.fromJson(x)));

String commentEntityToJson(List<CommentEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentEntity {
  CommentEntity({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  factory CommentEntity.fromJson(Map<String, dynamic> json) => CommentEntity(
        postId: json["postId"] == null ? null : json["postId"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        body: json["body"] == null ? null : json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId == null ? null : postId,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "body": body == null ? null : body,
      };
}
