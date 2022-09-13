
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/main_item_data_model.dart';
import '../../data/models/new_popular_data_model.dart';

NewPopularItems newPopularItemsFromJson(String str) =>
    NewPopularItemsModel.fromJson(json.decode(str));

String newPopularItemsToJson(NewPopularDataModel data) =>
    json.encode(data.toJson());

class NewPopularItems extends Equatable {
  const NewPopularItems({
    required this.data,
  });

  final NewPopularDataModel? data;

  @override
  List<Object?> get props => [data];
}

class NewPopularData extends Equatable {
  const NewPopularData({
    required this.dataNew,
    required this.popular,
  });

  final List<MainItemModel>? dataNew;
  final List<MainItemModel>? popular;

  @override
  List<Object?> get props => [dataNew, popular];
}
