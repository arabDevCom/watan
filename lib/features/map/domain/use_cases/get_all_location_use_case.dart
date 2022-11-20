import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_all_location_model.dart';
import '../repositories/base_map_repositories.dart';

class GetAllLocationsUseCase implements UseCase<AllLocationsModel, NoParams> {
  final BaseMapRepositories baseMapRepositories;

  const GetAllLocationsUseCase({required this.baseMapRepositories});

  @override
  Future<Either<Failure, AllLocationsModel>> call(NoParams params) =>
      baseMapRepositories.getAllLocations();
}
