import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../entities/all_project_posts.dart';
import '../repositories/base__project_details_repositories.dart';

class AllPostsForProjectUseCase extends UseCase<AllPostsProject,String>{
  final BaseProjectDetailsRepositories baseProjectDetailsRepositories;

  AllPostsForProjectUseCase(this.baseProjectDetailsRepositories);
  @override
  Future<Either<Failure, AllPostsProject>> call(String params) =>
      baseProjectDetailsRepositories.allUserPosts(params);
}