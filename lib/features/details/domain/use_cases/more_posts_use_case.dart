import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../entities/more_posts.dart';
import '../repositories/base_details_repositories.dart';

class MorePostsUseCase extends UseCase<MorePostsDetails,String>{
  final BaseIncreaseViewRepositories baseIncreaseViewRepositories;

  MorePostsUseCase(this.baseIncreaseViewRepositories);
  @override
  Future<Either<Failure, MorePostsDetails>> call(String params) =>
      baseIncreaseViewRepositories.morePosts(params);
}