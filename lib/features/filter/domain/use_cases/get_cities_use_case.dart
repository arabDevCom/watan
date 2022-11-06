import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/cities_data_model.dart';
import '../repositories/base_filter_repositories.dart';

class GetCitiesUseCase implements UseCase<CitiesFilterModel, NoParams> {
  final BaseFilterRepositories baseFilterRepositories;

  const GetCitiesUseCase({required this.baseFilterRepositories});

  @override
  Future<Either<Failure, CitiesFilterModel>> call(NoParams params) =>
      baseFilterRepositories.getCitiesData();
}
