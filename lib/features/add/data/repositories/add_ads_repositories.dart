import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';

import 'package:elwatn/features/add/domain/entities/add_ads_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_message.dart';
import '../../domain/repositories/add_ads_base_repositories.dart';
import '../data_sources/add_ads_data_source.dart';

class AddAdsRepositories extends BaseAddAdsRepositories {
  final BaseAddAdsDataSource baseAddAdsDataSource;

  AddAdsRepositories(this.baseAddAdsDataSource);
  @override
  Future<Either<Failure, StatusResponse>> addAds(AddAdsModel addAdsModel) async {
    try {
      final response = await baseAddAdsDataSource.addAds(addAdsModel);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StatusResponse>> addProject(AddAdsModel addAdsModel) async {
    try {
      final response = await baseAddAdsDataSource.addProject(addAdsModel);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StatusResponse>> updateAds(AddAdsModel addAdsModel) async {
    try {
      final response = await baseAddAdsDataSource.updateAds(addAdsModel);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}