// To parse this JSON data, do
//
//     final citiesFilter = citiesFilterFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/cities_data_model.dart';

CitiesFilter citiesFilterFromJson(String str) => CitiesFilterModel.fromJson(json.decode(str));

String citiesFilterToJson(CitiesFilterModel data) => json.encode(data.toJson());

class CitiesFilter extends Equatable{
  CitiesFilter({
    required this.data,
  });

  List<CitiesDatumModel>? data;



  @override
  List<Object?> get props => [
    data
  ];
}

class CitiesDatum extends Equatable{
  CitiesDatum({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.nameKu,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  String? nameAr;
  String? nameEn;
  String? nameKu;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;



  @override
  List<Object?> get props => [
    id,
    nameAr,
    nameEn,
    image,
    createdAt,
    updatedAt,
  ];
}
