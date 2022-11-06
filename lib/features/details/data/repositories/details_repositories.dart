import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';

import 'package:elwatn/core/usecases/usecase.dart';
import 'package:elwatn/features/details/domain/entities/all_posts_for_user.dart';
import 'package:elwatn/features/details/domain/entities/more_posts.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/base_details_repositories.dart';
import '../data_sources/details_data_source.dart';

class IncreaseViewRepositories extends BaseIncreaseViewRepositories{

  final BaseDetailsDataSource baseIncreaseViewDataSource;

  IncreaseViewRepositories(this.baseIncreaseViewDataSource);
  @override
  Future<Either<Failure, NoParams>> increaseViews(String id) async {
    try {
       await baseIncreaseViewDataSource.increaseViews(id);
      return Right(NoParams());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MorePostsDetails>> morePosts(String id) async {
    try {
    final response =  await baseIncreaseViewDataSource.morePosts(id);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AllPostsUser>> allUserPosts(String id) async {
    try {
      final response =  await baseIncreaseViewDataSource.allUserPosts(id);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}