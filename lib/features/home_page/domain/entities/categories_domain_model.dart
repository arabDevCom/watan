// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/categories_data_model.dart';

Categories categoriesFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesToJson(CategoriesModel data) => json.encode(data.toJson());

class Categories extends Equatable {
  const Categories({
    required this.data,
  });

  final List<CategoriesDatumModel>? data;

  @override
  List<Object?> get props => [data];
}

class CategoriesDatum extends Equatable {
  const CategoriesDatum({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.nameKo,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? nameAr;
  final String? nameEn;
  final String? nameKo;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props =>
      [id, nameAr, nameEn, nameKo, image, createdAt, updatedAt];
}
