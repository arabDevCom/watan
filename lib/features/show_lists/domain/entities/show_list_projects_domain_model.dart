import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../home_page/data/models/main_project_item_data_model.dart';
import '../../../show_more_posts/data/models/show_more_data_model.dart';
import '../../data/models/show_list_projects_data_model.dart';

ShowProjectsList showMoreFromJson(String str) =>
    ShowProjectsListModel.fromJson(json.decode(str));

String showMoreToJson(ShowProjectsListModel data) => json.encode(data.toJson());

class ShowProjectsList extends Equatable {
  const ShowProjectsList({
    required this.data,
  });

  final ShowProjectsListDataModel? data;

  @override
  List<Object?> get props => [data];
}

class ShowProjectsListData extends Equatable {
  const ShowProjectsListData({
    required this.firstPageUrl,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.mainProjectItem,
  });

  final List<MainProjectItemModel>? mainProjectItem;
  final String firstPageUrl;
  final String lastPageUrl;
  final String nextPageUrl;

  @override
  List<Object?> get props => [
        mainProjectItem,
        firstPageUrl,
        lastPageUrl,
        nextPageUrl,
      ];
}
