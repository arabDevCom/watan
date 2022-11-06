
import 'dart:convert';

import 'package:elwatn/features/home_page/data/models/main_project_item_data_model.dart';

MoreProjectPostsDetails morePostsDetailsFromJson(String str) => MoreProjectPostsDetails.fromJson(json.decode(str));

String morePostsDetailsToJson(MoreProjectPostsDetails data) => json.encode(data.toJson());

class MoreProjectPostsDetails {
  MoreProjectPostsDetails({
    this.data,
  });

  MoreProjectPostsData? data;

  factory MoreProjectPostsDetails.fromJson(Map<String, dynamic> json) => MoreProjectPostsDetails(
    data: MoreProjectPostsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class MoreProjectPostsData {
  MoreProjectPostsData({
    this.postDetails,
    this.moreProject,
  });

  MainProjectItemModel? postDetails;
  List<MainProjectItemModel>? moreProject;

  factory MoreProjectPostsData.fromJson(Map<String, dynamic> json) => MoreProjectPostsData(
    postDetails: MainProjectItemModel.fromJson(json["project_details"]),
    moreProject: List<MainProjectItemModel>.from(json["more_projects"].map((x) => MainProjectItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "project_details": postDetails!.toJson(),
    "more_projects": List<dynamic>.from(moreProject!.map((x) => x.toJson())),
  };
}