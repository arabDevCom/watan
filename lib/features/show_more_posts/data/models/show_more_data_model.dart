import '../../../home_page/data/models/main_item_data_model.dart';
import '../../domain/entities/show_more_domain_model.dart';

class ShowMoreModel extends ShowMore {
  const ShowMoreModel({required super.data});

  factory ShowMoreModel.fromJson(Map<String, dynamic> json) => ShowMoreModel(
        data: ShowMoreDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class ShowMoreDataModel extends ShowMoreData {
  const ShowMoreDataModel({required super.mainItem, required super.links});

  factory ShowMoreDataModel.fromJson(Map<String, dynamic> json) =>
      ShowMoreDataModel(
        mainItem: List<MainItemModel>.from(
            json["data"].map((x) => MainItemModel.fromJson(x))),
        links: LinksModel.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(mainItem!.map((x) => x.toJson())),
        "links": links!.toJson(),
      };
}

class LinksModel extends Links {
  const LinksModel(
      {required super.first,
      required super.last,
      required super.prev,
      required super.next});

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}
