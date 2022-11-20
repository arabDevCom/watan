import 'dart:convert';

import 'package:elwatn/features/home_page/data/models/main_item_data_model.dart';
import 'package:equatable/equatable.dart';

import '../../../home_page/data/models/main_project_item_data_model.dart';
import '../../data/models/my_ads_data_model.dart';

ProfileAds profileAdsFromJson(String str) =>
    ProfileAdsModel.fromJson(json.decode(str));

String profileAdsToJson(ProfileAdsModel data) => json.encode(data.toJson());

class ProfileAds extends Equatable {
  ProfileAds({
    required this.data,
  });

  ProfileAdsDataModel? data;


  @override
  List<Object?> get props => [data];
}

class ProfileAdsData extends Equatable {
  ProfileAdsData({
     this.forSale,
     this.forRent,
     this.forSaleProject,
  });

  List<MainItemModel>? forSale;
  List<MainItemModel>? forRent;
  List<MainProjectItemModel>? forSaleProject;

  @override
  List<Object?> get props => [forSale, forRent];
}
