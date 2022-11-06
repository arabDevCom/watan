import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../entities/all_posts_for_user.dart';
import '../entities/more_posts.dart';
import '../repositories/base_details_repositories.dart';

class AllPostsForUserUseCase extends UseCase<AllPostsUser,String>{
  final BaseIncreaseViewRepositories baseIncreaseViewRepositories;

  AllPostsForUserUseCase(this.baseIncreaseViewRepositories);
  @override
  Future<Either<Failure, AllPostsUser>> call(String params) =>
      baseIncreaseViewRepositories.allUserPosts(params);
}