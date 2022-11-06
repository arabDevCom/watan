import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/models/response_message.dart';
import '../models/report_data_model.dart';

abstract class BaseReportDataSource {
  Future<StatusResponse> postReportPost(ReportPostModel reportPostModel);
}

class ReportDataSource implements BaseReportDataSource {
  final BaseApiConsumer apiConsumer;

  ReportDataSource(this.apiConsumer);

  @override
  Future<StatusResponse> postReportPost(ReportPostModel reportPostModel) async {
    Response response = await apiConsumer.newPost(
      EndPoints.makeReportUrl,
      body: reportPostModel.type == "ads"
          ? reportPostModel.image!.isEmpty
              ? reportPostModel.adsWithoutPhotoToJson()
              : await reportPostModel.adsWithPhotoToJson()
          : reportPostModel.image!.isEmpty
              ? reportPostModel.projectWithoutPhotoToJson()
              : await reportPostModel.projectWithPhotoToJson(),
      formDataIsEnabled: true,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {"Authorization": reportPostModel.token},
      ),
    );
    print("000000000000000000000000000");
    print(response.data);
    return StatusResponse.fromJson(jsonDecode(response.data));
  }
}
