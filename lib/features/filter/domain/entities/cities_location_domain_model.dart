// To parse this JSON data, do
//
//     final citiesLocations = citiesLocationsFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/cities_location_data_model.dart';

CitiesLocations citiesLocationsFromJson(String str) => CitiesLocationsModel.fromJson(json.decode(str));

String citiesLocationsToJson(CitiesLocationsModel data) => json.encode(data.toJson());

class CitiesLocations extends Equatable{
  CitiesLocations({
    required this.data,
  });

  List<CitiesLocationDatumModel>? data;


  @override
  List<Object?> get props => [
    data
  ];
}

class CitiesLocationDatum extends Equatable{
  CitiesLocationDatum({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.nameKu,
    required this.areaId,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  String? nameAr;
  String? nameEn;
  String? nameKu;
  int? areaId;
  DateTime? createdAt;
  DateTime? updatedAt;


  @override
  List<Object?> get props => [
    id,
    nameAr,
    nameEn,
    areaId,
    createdAt,
    updatedAt,
  ];
}
