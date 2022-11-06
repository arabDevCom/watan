
import 'package:dartz/dartz.dart';
import 'package:elwatn/core/models/response_message.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/base_my_ads_repositories.dart';
import '../data_sources/my_ads_data_source.dart';
import '../models/my_ads_data_model.dart';

class MyAdsRepositories implements BaseMyAdsRepositories{

  final BaseMyAdsDataSource baseMyAdsDataSource;

  MyAdsRepositories({required this.baseMyAdsDataSource});

  @override
  Future<Either<Failure, ProfileAdsModel>> getMyAds(List<String> token) async {
    try {
      final profileAdsModel = await baseMyAdsDataSource.getMyAds(token);
      return Right(profileAdsModel);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StatusResponse>> deleteMyAds(List<String> token) async {
    try {
      final response = await baseMyAdsDataSource.deleteMyAds(token);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StatusResponse>> changeStatusMyAds(List<String> token) async {
    try {
      final response = await baseMyAdsDataSource.changeStatusMyAds(token);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }


}
