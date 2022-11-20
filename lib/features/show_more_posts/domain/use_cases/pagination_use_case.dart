import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/show_more_domain_model.dart';
import '../repositories/base_show_more_repositories.dart';

class GetPaginationUseCase implements UseCase<ShowMore, List<String>> {
  final BaseShowMoreRepositories baseShowMoreRepositories;

  const GetPaginationUseCase({required this.baseShowMoreRepositories});

  @override
  Future<Either<Failure, ShowMore>> call(List<String> params) =>
      baseShowMoreRepositories.getPaginationData(params);
}
