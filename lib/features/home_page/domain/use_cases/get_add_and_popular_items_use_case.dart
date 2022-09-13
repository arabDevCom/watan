import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/categories_domain_model.dart';
import '../entities/new_popular_domain_model.dart';
import '../repositories/base_home_repositories.dart';

class GetNewAndPopularItemsUseCase implements UseCase<NewPopularItems, NoParams> {
  final BaseHomeRepositories baseHomeRepositories;

  const GetNewAndPopularItemsUseCase({required this.baseHomeRepositories});

  @override
  Future<Either<Failure, NewPopularItems>> call(NoParams params) =>
      baseHomeRepositories.getNewPopularItems();
}
