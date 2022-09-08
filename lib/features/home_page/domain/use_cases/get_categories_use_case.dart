import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/categories_domain_model.dart';
import '../repositories/base_home_repositories.dart';

class GetCategoriesUseCase implements UseCase<Categories, NoParams> {
  final BaseHomeRepositories baseHomeRepositories;

  const GetCategoriesUseCase({required this.baseHomeRepositories});

  @override
  Future<Either<Failure, Categories>> call(NoParams params) =>
      baseHomeRepositories.getCategoriesData();
}
