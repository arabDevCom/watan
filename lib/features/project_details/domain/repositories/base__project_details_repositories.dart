import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../entities/all_project_posts.dart';
import '../entities/more_project_posts.dart';

abstract class BaseProjectDetailsRepositories{
  Future<Either<Failure,NoParams>> increaseViews(String id);
  Future<Either<Failure,MoreProjectPostsDetails>> morePosts(String id);
  Future<Either<Failure,AllPostsProject>> allUserPosts(String id);
}