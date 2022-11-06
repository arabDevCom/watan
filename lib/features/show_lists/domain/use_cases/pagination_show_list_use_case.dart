import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../show_more_posts/data/models/show_more_data_model.dart';
import '../../../show_more_posts/domain/entities/show_more_domain_model.dart';
import '../repositories/base_show_lists_repositories.dart';

class GetPaginationShowListUseCase implements UseCase<ShowMoreDataModel, String> {
  final BaseShowListsRepositories baseShowListsRepositories;

  const GetPaginationShowListUseCase({required this.baseShowListsRepositories});

  @override
  Future<Either<Failure, ShowMoreDataModel>> call(String params) =>
      baseShowListsRepositories.getPaginationOfShowListsData(params);
}
