import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../repositories/base__project_details_repositories.dart';

class IncreaseProjectViewUseCase extends UseCase<NoParams,String>{
  final BaseProjectDetailsRepositories baseProjectDetailsRepositories;

  IncreaseProjectViewUseCase(this.baseProjectDetailsRepositories);
  @override
  Future<Either<Failure, NoParams>> call(String params) =>
      baseProjectDetailsRepositories.increaseViews(params);
}