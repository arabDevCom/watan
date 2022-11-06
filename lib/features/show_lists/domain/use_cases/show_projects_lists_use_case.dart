import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/show_list_projects_data_model.dart';
import '../repositories/base_show_lists_repositories.dart';

class GetShowProjectsListsUseCase implements UseCase<ShowProjectsListDataModel, String> {
  final BaseShowListsRepositories baseShowListsRepositories;

  const GetShowProjectsListsUseCase({required this.baseShowListsRepositories});

  @override
  Future<Either<Failure, ShowProjectsListDataModel>> call(String params) =>
      baseShowListsRepositories.getShowProjectListsData(params);
}
