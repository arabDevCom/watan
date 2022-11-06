import '../../../home_page/data/models/main_item_data_model.dart';
import '../../domain/entities/my_ads_domain_model.dart';

class ProfileAdsModel extends ProfileAds{
  ProfileAdsModel({required super.data});

  factory ProfileAdsModel.fromJson(Map<String, dynamic> json) => ProfileAdsModel(
    data: ProfileAdsDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class ProfileAdsDataModel extends ProfileAdsData{
  ProfileAdsDataModel({required super.forSale, required super.forRent});

  factory ProfileAdsDataModel.fromJson(Map<String, dynamic> json) => ProfileAdsDataModel(
    forSale: List<MainItemModel>.from(
        json["for_sale"].map((x) => MainItemModel.fromJson(x))),
    forRent: List<MainItemModel>.from(
        json["for_rent"].map((x) => MainItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "for_sale": List<dynamic>.from(forSale!.map((x) => x.toJson())),
    "for_rent": List<dynamic>.from(forRent!.map((x) => x.toJson())),
  };

}