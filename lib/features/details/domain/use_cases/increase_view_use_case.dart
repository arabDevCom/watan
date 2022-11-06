import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../repositories/base_details_repositories.dart';

class IncreaseViewUseCase extends UseCase<NoParams,String>{
  final BaseIncreaseViewRepositories baseIncreaseViewRepositories;

  IncreaseViewUseCase(this.baseIncreaseViewRepositories);
  @override
  Future<Either<Failure, NoParams>> call(String params) =>
    baseIncreaseViewRepositories.increaseViews(params);
}