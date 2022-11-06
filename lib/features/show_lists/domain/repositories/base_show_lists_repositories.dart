import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../show_more_posts/data/models/show_more_data_model.dart';
import '../../data/models/show_list_projects_data_model.dart';


abstract class BaseShowListsRepositories{
  Future<Either<Failure, ShowMoreDataModel>> getShowListsData(String param);
  Future<Either<Failure, ShowProjectsListDataModel>> getShowProjectListsData(String param);
  Future<Either<Failure, ShowMoreDataModel>> getPaginationOfShowListsData(String param);
  Future<Either<Failure, ShowProjectsListDataModel>> getPaginationOfShowProjectsListsData(String param);
}