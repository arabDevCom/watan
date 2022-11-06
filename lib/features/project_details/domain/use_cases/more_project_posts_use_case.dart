import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../entities/more_project_posts.dart';
import '../repositories/base__project_details_repositories.dart';

class MoreProjectPostsUseCase extends UseCase<MoreProjectPostsDetails,String>{
  final BaseProjectDetailsRepositories baseProjectDetailsRepositories;

  MoreProjectPostsUseCase(this.baseProjectDetailsRepositories);
  @override
  Future<Either<Failure, MoreProjectPostsDetails>> call(String params) =>
      baseProjectDetailsRepositories.morePosts(params);
}