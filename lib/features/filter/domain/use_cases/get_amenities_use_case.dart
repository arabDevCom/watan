import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/amenities_data_model.dart';
import '../../data/models/cities_data_model.dart';
import '../repositories/base_filter_repositories.dart';

class GetAmenitiesUseCase implements UseCase<AmenitiesFilterModel, NoParams> {
  final BaseFilterRepositories baseFilterRepositories;

  const GetAmenitiesUseCase({required this.baseFilterRepositories});

  @override
  Future<Either<Failure, AmenitiesFilterModel>> call(NoParams params) =>
      baseFilterRepositories.getAmenitiesData();
}
