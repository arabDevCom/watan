import '../../../home_page/data/models/main_item_data_model.dart';
import '../../../home_page/data/models/main_project_item_data_model.dart';
import '../../domain/entities/my_ads_domain_model.dart';

class ProfileAdsModel extends ProfileAds {
  ProfileAdsModel({required super.data});

  factory ProfileAdsModel.fromJson(Map<String, dynamic> json) =>
      ProfileAdsModel(
        data: ProfileAdsDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };

  factory ProfileAdsModel.fromJsonProject(Map<String, dynamic> json) =>
      ProfileAdsModel(
        data: ProfileAdsDataModel.fromJsonProject(json["data"]),
      );

  Map<String, dynamic> toJsonProject() => {
    "data": data!.toJsonProject(),
  };
}

class ProfileAdsDataModel extends ProfileAdsData {
  ProfileAdsDataModel({super.forSale, super.forRent, super.forSaleProject});

  factory ProfileAdsDataModel.fromJson(Map<String, dynamic> json) =>
      ProfileAdsDataModel(
        forSale: List<MainItemModel>.from(
            json["for_sale"].map((x) => MainItemModel.fromJson(x))),
        forRent: List<MainItemModel>.from(
            json["for_rent"].map((x) => MainItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "for_sale": List<dynamic>.from(forSale!.map((x) => x.toJson())),
        "for_rent": List<dynamic>.from(forRent!.map((x) => x.toJson())),
      };

  factory ProfileAdsDataModel.fromJsonProject(Map<String, dynamic> json) =>
      ProfileAdsDataModel(
        forSaleProject: List<MainProjectItemModel>.from(
          json["for_sale"].map(
            (x) => MainProjectItemModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJsonProject() => {
        "for_sale": List<dynamic>.from(forSaleProject!.map((x) => x.toJson())),
      };
}
