import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../entities/all_posts_for_user.dart';
import '../entities/more_posts.dart';

abstract class BaseIncreaseViewRepositories{
  Future<Either<Failure,NoParams>> increaseViews(String id);
  Future<Either<Failure,MorePostsDetails>> morePosts(String id);
  Future<Either<Failure,AllPostsUser>> allUserPosts(String id);
}