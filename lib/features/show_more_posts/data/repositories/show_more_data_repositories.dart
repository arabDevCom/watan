import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/features/show_more_posts/domain/entities/show_more_domain_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/base_show_more_repositories.dart';
import '../data_sources/show_more_data_source.dart';

class ShowMoreRepositories implements BaseShowMoreRepositories{
  final BaseNetworkInfo networkInfo;
  final BaseShowDataDataSource showDataDataSource;

  ShowMoreRepositories({required this.networkInfo,required this.showDataDataSource});

  @override
  Future<Either<Failure, ShowMore>> getShowMoreData(String param) async {
    try {
      final showMoreData = await showDataDataSource.getShowMoreData(param);
      return Right(showMoreData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ShowMore>> getPaginationData(String param) async {
    try {
      final showMoreData = await showDataDataSource.getPaginationData(param);
      return Right(showMoreData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }







}
