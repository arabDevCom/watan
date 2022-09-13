import 'dart:convert';

import 'package:elwatn/features/home_page/data/models/main_item_data_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/show_more_data_model.dart';

ShowMore showMoreFromJson(String str) =>
    ShowMoreModel.fromJson(json.decode(str));

String showMoreToJson(ShowMoreModel data) => json.encode(data.toJson());

class ShowMore extends Equatable {
  const ShowMore({
    required this.data,
  });

  final ShowMoreDataModel? data;

  @override
  List<Object?> get props => [data];
}

class ShowMoreData extends Equatable {
  const ShowMoreData({
    required this.mainItem,
    required this.links,
  });

  final List<MainItemModel>? mainItem;
  final LinksModel? links;

  @override
  List<Object?> get props => [mainItem, links];
}

class Links extends Equatable {
  const Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  @override
  List<Object?> get props => [first, last, prev, next];
}
