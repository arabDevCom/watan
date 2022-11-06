import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../entities/bloggs_domain_model.dart';
import '../repositories/base_bloggs_repositories.dart';

class GetBloggsUseCase extends UseCase<Bloggs, NoParams> {
  final BaseBloggsRepositories baseBloggsRepositories;

  GetBloggsUseCase({required this.baseBloggsRepositories});

  @override
  Future<Either<Failure, Bloggs>> call(NoParams params) =>
      baseBloggsRepositories.getBloggsData();
}
