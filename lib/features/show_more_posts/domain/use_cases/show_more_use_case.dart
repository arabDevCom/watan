import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/show_more_domain_model.dart';
import '../repositories/base_show_more_repositories.dart';

class GetShowMoreUseCase implements UseCase<ShowMore, String> {
  final BaseShowMoreRepositories baseShowMoreRepositories;

  const GetShowMoreUseCase({required this.baseShowMoreRepositories});

  @override
  Future<Either<Failure, ShowMore>> call(String params) =>
      baseShowMoreRepositories.getShowMoreData(params);
}
