
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/bloggs_data_model.dart';

Bloggs bloggsFromJson(String str) => BloggsModel.fromJson(json.decode(str));

String bloggsToJson(BloggsModel data) => json.encode(data.toJson());

class Bloggs extends Equatable{
  const Bloggs({
   required this.data,
  });

 final List<BloggsDatumModel>? data;

  @override
  List<Object?> get props => [data];
}

class BloggsDatum extends Equatable{
  const BloggsDatum({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.nameKu,
    required this.image,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.descriptionKu,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? nameAr;
  final String? nameEn;
  final String? nameKu;
  final String? image;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? descriptionKu;
  final DateTime? createdAt;
  final DateTime? updatedAt;


  @override
  List<Object?> get props => [
    id,
    nameAr,
    nameEn,
    nameKu,
    image,
    descriptionAr,
    descriptionEn,
    descriptionKu,
    createdAt,
    updatedAt,
  ];
}
