// To parse this JSON data, do
//
//     final filterResponse = filterResponseFromJson(jsonString);

import 'dart:convert';

import 'package:elwatn/features/home_page/data/models/main_item_data_model.dart';
import 'package:equatable/equatable.dart';

import '../../../home_page/data/models/main_project_item_data_model.dart';

FilterResponse filterResponseFromJson(String str) => FilterResponse.fromJson(json.decode(str));

String filterResponseToJson(FilterResponse data) => json.encode(data.toJson());

class FilterResponse extends Equatable{
  const FilterResponse({
    this.data,
  });

  final FilterResponseData? data;

  factory FilterResponse.fromJson(Map<String, dynamic> json) => FilterResponse(
    data: FilterResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };

  @override
  List<Object?> get props => [data];
}

class FilterResponseData extends Equatable{
  const FilterResponseData({
    this.ads,
    this.projects,
  });

 final List<MainItemModel>? ads;
 final List<MainProjectItemModel>? projects;

  factory FilterResponseData.fromJson(Map<String, dynamic> json) => FilterResponseData(
    ads: List<MainItemModel>.from(json["ads"].map((x) => MainItemModel.fromJson(x))),
    projects: List<MainProjectItemModel>.from(json["porjects"].map((x) => MainProjectItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ads": List<dynamic>.from(ads!.map((x) => x.toJson())),
    "porjects": List<dynamic>.from(projects!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [
    ads,
    projects
  ];
}