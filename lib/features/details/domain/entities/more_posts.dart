
import 'dart:convert';

import '../../../home_page/data/models/main_item_data_model.dart';

MorePostsDetails morePostsDetailsFromJson(String str) => MorePostsDetails.fromJson(json.decode(str));

String morePostsDetailsToJson(MorePostsDetails data) => json.encode(data.toJson());

class MorePostsDetails {
  MorePostsDetails({
    this.data,
  });

  MorePostsData? data;

  factory MorePostsDetails.fromJson(Map<String, dynamic> json) => MorePostsDetails(
    data: MorePostsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class MorePostsData {
  MorePostsData({
    this.postDetails,
    this.moreAds,
  });

  MainItemModel? postDetails;
  List<MainItemModel>? moreAds;

  factory MorePostsData.fromJson(Map<String, dynamic> json) => MorePostsData(
    postDetails: MainItemModel.fromJson(json["post_details"]),
    moreAds: List<MainItemModel>.from(json["more_ads"].map((x) => MainItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "post_details": postDetails!.toJson(),
    "more_ads": List<dynamic>.from(moreAds!.map((x) => x.toJson())),
  };
}