import 'package:dio/dio.dart';

import '../../domain/entities/report_domain_model.dart';

class ReportPostModel extends ReportPost {
  ReportPostModel({
    super.title,
    super.description,
    super.postId,
    super.projectId,
    super.image,
    super.token,
    super.type,
  });
  factory ReportPostModel.fromJson(Map<String, dynamic> json) => ReportPostModel(
    title: json["title"],
    description: json["description"],
    postId: json["post_id"],
    projectId: json["project_id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "post_id": postId,
    "project_id": projectId,
    "image": image,
  };
  Future<Map<String, dynamic>> projectWithPhotoToJson() async => {
    "title": title,
    "description": description,
    "project_id": projectId,
    "image": image != null ? await MultipartFile.fromFile(image!) : "",
  };
  Map<String, dynamic> projectWithoutPhotoToJson() => {
    "title": title,
    "description": description,
    "project_id": projectId,
  };
  Future<Map<String, dynamic>> adsWithPhotoToJson() async => {
    "title": title,
    "description": description,
    "post_id": postId,
    "image": image != null ? await MultipartFile.fromFile(image!) : "",
  };
  Map<String, dynamic> adsWithoutPhotoToJson() => {
    "title": title,
    "description": description,
    "post_id": postId,
  };

}
