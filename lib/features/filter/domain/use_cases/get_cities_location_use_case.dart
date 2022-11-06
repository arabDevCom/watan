import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/cities_location_data_model.dart';
import '../repositories/base_filter_repositories.dart';

class GetCitiesLocationUseCase implements UseCase<CitiesLocationsModel, String> {
  final BaseFilterRepositories baseFilterRepositories;

  const GetCitiesLocationUseCase({required this.baseFilterRepositories});

  @override
  Future<Either<Failure, CitiesLocationsModel>> call(String id) =>
      baseFilterRepositories.getCitiesLocationData(id);
}
