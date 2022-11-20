import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';

import 'package:elwatn/features/map/domain/entities/get_all_location_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/base_map_repositories.dart';
import '../data_sources/map_data_source.dart';

class MapRepositories extends BaseMapRepositories{
  final BaseMapDataSource baseMapDataSource;

  MapRepositories(this.baseMapDataSource);
  @override
  Future<Either<Failure, AllLocationsModel>> getAllLocations() async {
    try {
      final response = await baseMapDataSource.getAllLocations();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}