import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../show_more_posts/data/models/show_more_data_model.dart';
import '../../../show_more_posts/domain/entities/show_more_domain_model.dart';
import '../../data/models/show_list_projects_data_model.dart';
import '../repositories/base_show_lists_repositories.dart';

class GetPaginationShowProjectsListUseCase implements UseCase<ShowProjectsListDataModel, String> {
  final BaseShowListsRepositories baseShowListsRepositories;

  const GetPaginationShowProjectsListUseCase({required this.baseShowListsRepositories});

  @override
  Future<Either<Failure, ShowProjectsListDataModel>> call(String params) =>
      baseShowListsRepositories.getPaginationOfShowProjectsListsData(params);
}
