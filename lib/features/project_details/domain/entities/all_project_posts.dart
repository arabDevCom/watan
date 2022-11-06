
import 'dart:convert';

import 'package:elwatn/features/home_page/data/models/main_project_item_data_model.dart';


AllPostsProject morePostsDetailsFromJson(String str) => AllPostsProject.fromJson(json.decode(str));

String morePostsDetailsToJson(AllPostsProject data) => json.encode(data.toJson());

class AllPostsProject {
  AllPostsProject({
    this.data,
  });

  List<MainProjectItemModel>? data;

  factory AllPostsProject.fromJson(Map<String, dynamic> json) => AllPostsProject(
    data: List<MainProjectItemModel>.from(json["data"].map((x) => MainProjectItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}
