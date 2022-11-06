import 'package:dartz/dartz.dart';
import 'package:elwatn/core/models/response_message.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/my_ads_data_model.dart';


abstract class BaseMyAdsRepositories{
  Future<Either<Failure, ProfileAdsModel>> getMyAds(List<String> token);
  Future<Either<Failure, StatusResponse>> deleteMyAds(List<String> token);
  Future<Either<Failure, StatusResponse>> changeStatusMyAds(List<String> token);
}