
import 'dart:convert';

import '../../../home_page/data/models/main_item_data_model.dart';

AllPostsUser morePostsDetailsFromJson(String str) => AllPostsUser.fromJson(json.decode(str));

String morePostsDetailsToJson(AllPostsUser data) => json.encode(data.toJson());

class AllPostsUser {
  AllPostsUser({
    this.data,
  });

  List<MainItemModel>? data;

  factory AllPostsUser.fromJson(Map<String, dynamic> json) => AllPostsUser(
    data: List<MainItemModel>.from(json["data"].map((x) => MainItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}
