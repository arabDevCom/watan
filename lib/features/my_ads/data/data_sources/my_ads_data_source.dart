import 'package:dio/dio.dart';
import 'package:elwatn/core/models/response_message.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/my_ads_data_model.dart';

abstract class BaseMyAdsDataSource {
  Future<ProfileAdsModel> getMyAds(List<String> token);

  Future<StatusResponse> deleteMyAds(List<String> token);

  Future<StatusResponse> changeStatusMyAds(List<String> token);
}

class MyAdsDataSource implements BaseMyAdsDataSource {
  final BaseApiConsumer apiConsumer;

  const MyAdsDataSource({required this.apiConsumer});

  @override
  Future<ProfileAdsModel> getMyAds(List<String> token) async {
    final response = await apiConsumer.get(
      token[1] == 'myAds' ? EndPoints.myAdsUrl : EndPoints.mySolidUrl,
      options: Options(
        headers: {"Authorization": token[0]},
      ),
    );
    return ProfileAdsModel.fromJson(response);
  }

  @override
  Future<StatusResponse> deleteMyAds(List<String> token) async {
    final response = await apiConsumer.post(
      EndPoints.deleteAdsUrl + token[0],
      body: {"_method": "delete"},
      options: Options(
        headers: {"Authorization": token[1]},
      ),
    );
    return StatusResponse.fromJson(response);
  }

  @override
  Future<StatusResponse> changeStatusMyAds(List<String> token) async {
    final response = await apiConsumer.post(
      EndPoints.changeStatusAdsUrl + token[0],
      options: Options(
        headers: {"Authorization": token[1]},
      ),
    );
    return StatusResponse.fromJson(response);
  }
}
