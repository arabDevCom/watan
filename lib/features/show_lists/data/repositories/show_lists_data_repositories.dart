import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/features/show_lists/data/models/show_list_projects_data_model.dart';
import 'package:elwatn/features/show_more_posts/domain/entities/show_more_domain_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../show_more_posts/data/models/show_more_data_model.dart';
import '../../domain/repositories/base_show_lists_repositories.dart';
import '../data_sources/show_lists_data_source.dart';

class ShowListsRepositories implements BaseShowListsRepositories{
  final BaseShowListsDataSource showListsDataSource;

  ShowListsRepositories({required this.showListsDataSource});

  @override
  Future<Either<Failure, ShowMoreDataModel>> getPaginationOfShowListsData(String param) async {
    try {
      final showMoreData = await showListsDataSource.getPaginationOfShowListsData(param);
      return Right(showMoreData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ShowMoreDataModel>> getShowListsData(String param) async {
    try {
      final showMoreData = await showListsDataSource.getShowListsData(param);
      return Right(showMoreData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ShowProjectsListDataModel>> getShowProjectListsData(String param) async {
    try {
      final showMoreProjectData = await showListsDataSource.getShowProjectsListsData(param);
      return Right(showMoreProjectData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ShowProjectsListDataModel>> getPaginationOfShowProjectsListsData(String param) async {
    try {
      final showMoreProjectsData = await showListsDataSource.getPaginationOfShowProjectsListsData(param);
      return Right(showMoreProjectsData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }







}
