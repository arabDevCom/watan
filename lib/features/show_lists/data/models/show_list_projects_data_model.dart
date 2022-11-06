import '../../../home_page/data/models/main_project_item_data_model.dart';
import '../../../show_more_posts/data/models/show_more_data_model.dart';
import '../../domain/entities/show_list_projects_domain_model.dart';

class ShowProjectsListModel extends ShowProjectsList {
  const ShowProjectsListModel({required super.data});

  factory ShowProjectsListModel.fromJson(Map<String, dynamic> json) =>
      ShowProjectsListModel(
        data: ShowProjectsListDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class ShowProjectsListDataModel extends ShowProjectsListData {
  const ShowProjectsListDataModel(
      {required super.mainProjectItem,
      required super.firstPageUrl,
      required super.lastPageUrl,
      required super.nextPageUrl});

  factory ShowProjectsListDataModel.fromJson(Map<String, dynamic> json) =>
      ShowProjectsListDataModel(
        mainProjectItem: List<MainProjectItemModel>.from(
            json["data"].map((x) => MainProjectItemModel.fromJson(x))),
        firstPageUrl: json["first_page_url"] ?? "",
        lastPageUrl: json["last_page_url"] ?? "",
        nextPageUrl: json["next_page_url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(mainProjectItem!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
      };
}
