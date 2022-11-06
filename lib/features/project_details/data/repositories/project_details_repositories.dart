import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';

import 'package:elwatn/core/usecases/usecase.dart';
import 'package:elwatn/features/project_details/domain/entities/all_project_posts.dart';
import 'package:elwatn/features/project_details/domain/entities/more_project_posts.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/base__project_details_repositories.dart';
import '../data_sources/project_details_data_source.dart';

class ProjectDetailsRepositories extends BaseProjectDetailsRepositories{

  final BaseProjectDetailsDataSource baseProjectDetailsDataSource;

  ProjectDetailsRepositories(this.baseProjectDetailsDataSource);




  @override
  Future<Either<Failure, MoreProjectPostsDetails>> morePosts(String id) async {
    try {
      final response =  await baseProjectDetailsDataSource.morePosts(id);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AllPostsProject>> allUserPosts(String id) async {
    try {
      final response =  await baseProjectDetailsDataSource.allUserPosts(id);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> increaseViews(String id) async {
    try {
      await baseProjectDetailsDataSource.increaseViews(id);
      return Right(NoParams());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}