// To parse this JSON data, do
//
//     final photoEntity = photoEntityFromJson(jsonString);

import 'dart:convert';

List<PhotoEntity> photoEntityFromJson(dynamic str) => List<PhotoEntity>.from(
    (str as List<dynamic>).map((x) => PhotoEntity.fromJson(x)));

String photoEntityToJson(List<PhotoEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoEntity {
  PhotoEntity({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  factory PhotoEntity.fromJson(Map<String, dynamic> json) => PhotoEntity(
        albumId: json["albumId"] == null ? null : json["albumId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
        thumbnailUrl:
            json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId == null ? null : albumId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
      };
}
