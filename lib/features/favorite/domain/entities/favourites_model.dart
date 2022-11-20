// To parse this JSON data, do
//
//     final favouritesModel = favouritesModelFromJson(jsonString);

import 'dart:convert';

import '../../../home_page/data/models/main_item_data_model.dart';
import '../../../home_page/data/models/main_project_item_data_model.dart';

FavouritesModel favouritesModelFromJson(String str) =>
    FavouritesModel.fromJson(json.decode(str));

String favouritesModelToJson(FavouritesModel data) =>
    json.encode(data.toJson());

class FavouritesModel {
  FavouritesModel({
    this.data,
    this.message,
    this.code,
  });

  FavouritesModelData? data;
  String? message;
  int? code;

  factory FavouritesModel.fromJson(Map<String, dynamic> json) =>
      FavouritesModel(
        data: FavouritesModelData.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "code": code,
      };
}

class FavouritesModelData {
  FavouritesModelData({
    this.postsFavourites,
    this.projectsFavourites,
  });

  List<MainItemModel>? postsFavourites;
  List<MainProjectItemModel>? projectsFavourites;

  factory FavouritesModelData.fromJson(Map<String, dynamic> json) =>
      FavouritesModelData(
        postsFavourites: List<MainItemModel>.from(
            json["posts_favourites"].map((x) => MainItemModel.fromJson(x))),
        projectsFavourites: List<MainProjectItemModel>.from(
            json["projects_favourites"]
                .map((x) => MainProjectItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "posts_favourites":
            List<dynamic>.from(postsFavourites!.map((x) => x.toJson())),
        "projects_favourites":
            List<dynamic>.from(projectsFavourites!.map((x) => x.toJson())),
      };
}
