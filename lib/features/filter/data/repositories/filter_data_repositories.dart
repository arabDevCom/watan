  import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/features/filter/data/models/agent_list_data_model.dart';
import 'package:elwatn/features/filter/data/models/amenities_data_model.dart';
import 'package:elwatn/features/filter/data/models/cities_data_model.dart';
import 'package:elwatn/features/filter/data/models/cities_location_data_model.dart';
import 'package:elwatn/features/filter/domain/entities/filterModel.dart';
import 'package:elwatn/features/filter/domain/entities/filter_response_domian_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/base_filter_repositories.dart';
import '../data_sources/filter_data_source.dart';

class FilterRepositories implements BaseFilterRepositories {
  final BaseFilterDataSource baseFilterDataSource;

  const FilterRepositories(
      {required this.baseFilterDataSource});

  @override
  Future<Either<Failure, AmenitiesFilterModel>> getAmenitiesData() async {
    try {
      final amenitiesData = await baseFilterDataSource.getAmenitiesData();
      return Right(amenitiesData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CitiesFilterModel>> getCitiesData() async {
    try {
      final citiesData = await baseFilterDataSource.getCitiesData();
      return Right(citiesData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CitiesLocationsModel>> getCitiesLocationData(String id) async {
    try {
      final citiesLocationData = await baseFilterDataSource.getCitiesLocationData(id);
      return Right(citiesLocationData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, FilterAgentListModel>> getAgentListData() async {
    try {
      final agentListData = await baseFilterDataSource.getAgentListData();
      return Right(agentListData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, FilterResponse>> getFiltersResponse(FilterModel filterModel) async {
    try {
      final filterResponse = await baseFilterDataSource.getFilterData(filterModel);
      return Right(filterResponse);
    } on ServerException {
      return Left(ServerFailure());
    }  }

  }


