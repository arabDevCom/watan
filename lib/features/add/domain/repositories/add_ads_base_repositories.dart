import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/models/response_message.dart';

import '../entities/add_ads_model.dart';

abstract class BaseAddAdsRepositories{
  Future<Either<Failure,StatusResponse>> addAds(AddAdsModel addAdsModel);
  Future<Either<Failure,StatusResponse>> updateAds(AddAdsModel addAdsModel);
  Future<Either<Failure,StatusResponse>> addProject(AddAdsModel addAdsModel);
}