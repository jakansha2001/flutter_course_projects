// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<PhotosModel> photosModelFromJson(String str) => List<PhotosModel>.from(json.decode(str).map((x) => PhotosModel.fromJson(x)));

String photosModelToJson(List<PhotosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosModel {
    PhotosModel({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    factory PhotosModel.fromJson(Map<String, dynamic> json) => PhotosModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
