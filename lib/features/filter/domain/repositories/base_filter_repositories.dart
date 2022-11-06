import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/agent_list_data_model.dart';
import '../../data/models/amenities_data_model.dart';
import '../../data/models/cities_data_model.dart';
import '../../data/models/cities_location_data_model.dart';
import '../entities/filterModel.dart';
import '../entities/filter_response_domian_model.dart';

abstract class BaseFilterRepositories {
  Future<Either<Failure, CitiesFilterModel>> getCitiesData();

  Future<Either<Failure, CitiesLocationsModel>> getCitiesLocationData(String id);

  Future<Either<Failure, AmenitiesFilterModel>> getAmenitiesData();

  Future<Either<Failure, FilterAgentListModel>> getAgentListData();

  Future<Either<Failure, FilterResponse>> getFiltersResponse(FilterModel filterModel);
}
