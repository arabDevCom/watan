// To parse this JSON data, do
//
//     final slider = sliderFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/slider_data_model.dart';

HomeSlider sliderFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderToJson(SliderModel data) => json.encode(data.toJson());

class HomeSlider extends Equatable {
  const HomeSlider({
    this.data,
  });

  final List<DatumModel>? data;

  @override
  List<Object?> get props => [data];
}

class Datum extends Equatable {
  const Datum({
    this.image,
    this.link,
  });

  final String? image;
  final String? link;

  @override
  List<Object?> get props => [image, link];
}
