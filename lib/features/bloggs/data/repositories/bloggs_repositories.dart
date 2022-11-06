import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/exceptions.dart';

import 'package:elwatn/core/error/failures.dart';

import 'package:elwatn/features/bloggs/domain/entities/bloggs_domain_model.dart';

import '../../domain/repositories/base_bloggs_repositories.dart';
import '../data_sources/bloggs_data_source.dart';

class BloggsRepositories implements BaseBloggsRepositories{

  final BaseBloggsDataSource baseBloggsDataSource;

  BloggsRepositories({required this.baseBloggsDataSource});
  @override
  Future<Either<Failure, Bloggs>> getBloggsData() async {
    try{
      final getBloggs = await baseBloggsDataSource.getBloggsData();
      return Right(getBloggs);
    }on ServerException{
      return Left(ServerFailure());
    }
  }
}