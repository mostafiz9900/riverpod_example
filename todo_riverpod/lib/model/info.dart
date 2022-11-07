// To parse this JSON data, do
//
//     final infoModel = infoModelFromJson(jsonString);

import 'dart:convert';

List<InfoModel> infoModelFromJson(dynamic str) => List<InfoModel>.from(
    (str as List<dynamic>).map((x) => InfoModel.fromJson(x)));

String infoModelToJson(List<InfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfoModel {
  InfoModel({
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

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
