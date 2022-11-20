import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/get_all_location_model.dart';

abstract class BaseMapRepositories {
  Future<Either<Failure, AllLocationsModel>> getAllLocations();
}
