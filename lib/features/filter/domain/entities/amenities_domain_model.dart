// To parse this JSON data, do
//
//     final amenitiesFiltter = amenitiesFiltterFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/amenities_data_model.dart';

AmenitiesFilter amenitiesFilterFromJson(String str) =>
    AmenitiesFilterModel.fromJson(json.decode(str));

String amenitiesFilterToJson(AmenitiesFilterModel data) =>
    json.encode(data.toJson());

class AmenitiesFilter extends Equatable {
  AmenitiesFilter({
    required this.data,
  });

  List<AmenitiesDatumModel>? data;

  @override
  List<Object?> get props => [data];
}

class AmenitiesDatum extends Equatable {
  AmenitiesDatum({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.nameKo,
    required this.image,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  String? nameAr;
  String? nameEn;
  String? nameKo;
  String? image;
  String? icon;
  DateTime? createdAt;
  DateTime? updatedAt;

  @override
  List<Object?> get props => [
        id,
        nameAr,
        nameEn,
        nameKo,
        image,
        icon,
        createdAt,
        updatedAt,
      ];
}
