
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/report_data_model.dart';

ReportPost reportPostFromJson(String str) => ReportPostModel.fromJson(json.decode(str));

String reportPostToJson(ReportPostModel data) => json.encode(data.toJson());

class ReportPost extends Equatable{
  ReportPost({
     this.title,
     this.description,
     this.postId,
     this.projectId,
     this.image,
     this.token,
     this.type,
  });

  String? title;
  String? description;
  String? postId;
  String? projectId;
  String? image;
  String? token;
  String? type;


  @override
  List<Object?> get props => [
    title,
    description,
    postId,
    projectId,
    image,
  ];
}
